use std::sync::Arc;

use clap::{Parser, Subcommand};
use futures::SinkExt;
use tokio::time::{sleep, Duration};
use tokio::{signal, spawn};

use common::adapters::web_server_adapter::WebServerAdapter;
use common::ports::log_port::LoggerPort;
use common::ports::web_server_port::WebServerPort;

use crate::adapters::database_adapter::DatabaseAdapter;
use crate::adapters::ps_command_adapter::PsAdapter;
use crate::adapters::stress_ng_adapter::StressNgAdapter;
use crate::ports::database_port::DatabasePort;
use crate::ports::ps_command_port::PsCommandPort;

mod adapters;
mod ports;

// Enumeration representing the supported architectures for the `stress-ng`
// binary.
// This enum is used to select the correct binary for the running operating
// system.
#[derive(Debug)]
enum StressNgArch {
    Linux,
    MacOS,
}

// commandant-rs CLI Application
// This struct represents the command-line interface of the application,
// defining the available subcommands and their respective functionalities.
#[derive(Parser, Debug)]
#[clap(author = "Kenny Sheridan", version = "0.1 (Dev)", about = "commandant-rs -\
 An advanced tool for hardware performance testing and diagnostics.",
long_about = long_description())]
struct Cli {
    #[clap(subcommand)]
    command: Commands,
}

// Enum representing the different subcommands available in the CLI.
// Each variant corresponds to a specific functionality of the application.
#[derive(Subcommand, Debug)]
enum Commands {
    // Runs benchmark tests
    Benchmark,

    // Executes stress tests
    Stress,

    // Scans and analyzes hardware
    Discover,

    // Monitors hardware performance in real-time
    Overwatch,

    // Embedded Database Operations
    DatabaseOps,
}

/// # commandant-rs
///
/// commandant-rs is a comprehensive tool designed for in-depth hardware
/// performance analysis and diagnostics. It leverages advanced testing
/// methodologies to provide users with detailed insights into their
/// system's capabilities and bottlenecks. With commandant-rs, you can run
/// various tests, including benchmarks, stress tests, and hardware
/// discovery, to understand the full scope of your hardware's performance.
///
/// ## Modules
///
/// The tool is structured into several modules, each targeting a specific
/// aspect of hardware performance:
///
/// - **Benchmark**: Run extensive benchmarks to measure the speed and efficiency
///   of your CPU, GPU, memory, and storage devices.
///
/// - **Stress**: Put your system under intense stress to test stability and
///   endurance under heavy loads.
///
/// - **Discover**: Analyze and report on the configuration and current state of
///   your hardware components.
///
/// - **Overwatch**: Watch your system's performance in real-time, capturing
///   critical metrics and providing live feedback.
///
/// commandant-rs is designed with both simplicity and power in mind, making it
/// suitable for both casual users looking to check their system's performance
/// and professionals requiring detailed hardware analysis.
fn long_description() -> &'static str {
    "\n\n\ncommandant-rs is a comprehensive tool designed for in-depth hardware \
    performance analysis and diagnostics. \
    It leverages advanced testing methodologies to provide users with \
    detailed insights into their system's capabilities \
    and bottlenecks. With commandant-rs, you can run various tests, including \
    benchmarks, stress tests, and hardware discovery, \
    to understand the full scope of your hardware's performance.\n\n\
    The tool is structured into several modules, each targeting a specific \
    aspect of hardware performance:\n\n\
    \
    - Benchmark: Run extensive benchmarks to measure the speed and efficiency \
      of your CPU, GPU, memory, and storage devices.\n
    
    - Stress: Put your system under intense stress to test stability and \
    endurance under heavy loads.\n\
    \
    - Discover: Analyze and report on the configuration and current state of \
    your hardware components.\n\
    \
    - Overwatch: Watch your system's performance in real-time from the web browser, capturing \
    critical metrics and providing live feedback.\n
   
    commandant-rs is designed with both simplicity and power in mind, making it \
    suitable for both casual users looking to \
    check their system's performance and professionals requiring detailed \
    hardware analysis."
}

// The entry point of the application using Actix's asynchronous runtime.
// This runtime is essential for handling asynchronous tasks and is particularly suitable
// for web applications and services.
#[tokio::main]
async fn main() -> std::io::Result<()> {
    // Initialize the logging system with a specified directory and log level.
    // This setup is critical for ensuring that all parts of the application
    // can perform logging activities coherently. The logger is part of the
    // "adapters" layer in the Ports and Adapters architecture, interfacing
    // with the external logging framework.
    let log_directory = "logs"; // Directory where log files will be stored.
    let log_level = log::LevelFilter::Trace; // Log level indicating verbosity of the logs.
    let logger = Arc::new(common::adapters::log_adapter::init(
        log_directory,
        log_level,
    ));

    // Clone the logger into an Arc<dyn LoggerPort> type. This abstraction (LoggerPort)
    // allows different logging implementations to be plugged into the application without
    // changing the core logic, adhering to the principles of the Ports and Adapters architecture.
    let logger_as_port: Arc<dyn LoggerPort> = logger.clone();

    // Initialize the web server adapter with the logger. This adapter is responsible for
    // handling HTTP requests and serving web content. It represents the web server
    // "adapter" in the architecture.
    let web_server = WebServerAdapter::new(logger.clone());

    let db_logger = logger.clone(); // Clone the logger for database handling.

    // Attempt to create a new DatabaseAdapter
    let path_to_db = "commandant-rs_database_file.db"; // database path
    let db_adapter_result = DatabaseAdapter::new(path_to_db, db_logger.clone());

    // Handle the Result and create an Arc<dyn DatabasePort> if successful
    let db_adapter: Arc<dyn DatabasePort> = match db_adapter_result {
        Ok(adapter) => {
            db_logger.log_info("DatabaseAdapter created successfully.");
            Arc::new(adapter) // Cast the DatabaseAdapter to a trait object
        }
        Err(e) => {
            db_logger.log_error(&format!("Error creating DatabaseAdapter: {}", e));
            return Err(std::io::Error::new(
                std::io::ErrorKind::Other,
                "Failed to create DatabaseAdapter",
            ));
        }
    };

    // Initialize the PsAdapter with the logger and the DbAdapter for process monitoring and CPU usage analysis.
    let ps_adapter =
        Arc::new(PsAdapter::new(logger.clone(), db_adapter.clone())) as Arc<dyn PsCommandPort>;

    // Parse command-line arguments using the Cli struct, which is defined using the
    // `clap` crate. This struct represents the command-line interface of the application,
    // defining the available subcommands and their functionalities.
    let cli = Cli::parse();

    // Initialize the StressNgAdapter with the logger. This adapter is responsible for
    // conducting stress tests on the system, utilizing tools like `stress-ng`.
    let _stress_tester = StressNgAdapter::new(logger_as_port.clone());

    // Handle different commands provided via CLI in an async task. This design allows
    // the main thread to remain responsive and not blocked by long-running operations
    // triggered by CLI commands.
    let command_logger = logger.clone(); // Clone the logger for command handling.

    let ctrl_c_logger = logger.clone(); // Clone the logger for this specific task.

    let server_handle_logger = logger.clone(); // Clone the logger for the web server task.

    let (shutdown_sender, shutdown_receiver) = tokio::sync::mpsc::channel::<()>(1);

    // Set up handling for the Ctrl+C (interrupt) signal in a separate async task.
    // This approach enables the application to gracefully shut down in response to
    // interrupt signals.
    let ctrl_c_logger = logger.clone(); // Clone the logger for this specific task.
    let ctrl_c_handle = spawn(async move {
        signal::ctrl_c().await.expect("Failed to listen for Ctrl+C");
        ctrl_c_logger.log_info("Received Ctrl+C, shutting down.");
        // Send a shutdown signal to the web server task.
        let _ = shutdown_sender.send(()).await;
    });

    let db_logger = logger.clone(); // Clone the logger for database handling.

    // Attempt to create a new DatabaseAdapter
    let path_to_db = "commandant-rs_database_file.db"; // database path
    let db_adapter_result = DatabaseAdapter::new(path_to_db, db_logger.clone());

    let _command_handle = spawn(async move {
        match cli.command {
            // Handle each CLI command by invoking the appropriate functionality
            // and logging as needed. This part of the code can be seen as part of
            // the application's "core" or "domain logic."
            Commands::Benchmark => {
                // Logic for handling the 'Benchmark' command.
                command_logger.log_info("Benchmarking functionality not yet implemented.");
            }
            Commands::Stress => {
                // Define the arguments for the stress test.
                // The arguments are modified to create a more comprehensive and informative CPU stress test.

                // "--cpu 4" specifies that the stress test should use 4 CPU cores instead of 2.
                // This increases the load on the CPU for a more intensive stress test.
                let cpu_cores = "--cpu";
                let number_of_cores = "4";

                // "--timeout 120s" sets the test to run for 120 seconds, doubling the duration of the test
                // compared to the initial 60 seconds. This allows for a longer observation of CPU behavior
                // under stress.
                let timeout = "--timeout";
                let duration = "120s";

                // "--metrics-brief" outputs brief metrics about the stress test upon completion.
                // This option provides a summary of how the system responded to the stress test.
                let metrics = "--metrics-brief";

                // "--verbose" increases the verbosity of the output. This is useful for getting detailed
                // information about the stress test's operation and can aid in diagnosing issues or
                // understanding the system's behavior under load.
                let verbose = "--verbose";

                // Combine all the arguments into an array. These arguments will configure the behavior
                // of the `stress-ng` command to perform a more extensive and detailed stress test.
                let args = [
                    cpu_cores,
                    number_of_cores,
                    timeout,
                    duration,
                    metrics,
                    verbose,
                ];

                // Initialize the retry mechanism. This allows the stress test to be retried
                // a specified number of times in case of failure. In this case, the test
                // will be attempted up to 3 times (initial try + 2 retries).
                let mut retries = 2;
                // Start a loop for executing the stress test with retries.
                while retries >= 0 {
                    // Log the start of a stress test attempt. This is useful for monitoring
                    // and debugging purposes, allowing users to track the test's progress
                    // and retries.
                    command_logger.log_info(&format!(
                        "Executing CPU stress test. Attempts remaining: {}",
                        retries,
                    ));

                    // Execute the stress test command asynchronously.
                    // `StressNgAdapter::execute_stress_ng_command` is responsible for running
                    // the stress test using the `stress-ng` tool. The command is awaited
                    // to ensure the execution is complete before proceeding.
                    match StressNgAdapter::execute_stress_ng_command(command_logger.clone(), &args)
                        .await
                    {
                        // In case of a successful execution, log the success and exit the loop.
                        // This indicates that the stress test was completed without errors.
                        Ok(()) => {
                            command_logger.log_info("CPU stress test executed successfully.");
                            break;
                        }
                        // In case of an error, handle the retry mechanism.
                        Err(e) => {
                            // If there are retries left, log a warning and decrement the retry counter.
                            // The `sleep` call introduces a delay before the next attempt, giving
                            // the system some time to stabilize.
                            if retries > 0 {
                                command_logger.log_warn(&format!(
                                    "Retrying CPU stress test. Attempts remaining: {}",
                                    retries
                                ));
                                sleep(Duration::from_secs(10)).await;
                            } else {
                                // If there are no retries left, log the error and exit the loop.
                                // This indicates that all attempts to run the stress test have failed.
                                command_logger
                                    .log_error(&format!("Error executing CPU stress test: {}", e));
                            }
                        }
                    }
                    // Decrement the retry counter after each attempt.
                    retries -= 1;
                }
            }

            Commands::Discover => {
                // Logic for handling the 'Discover' command.
                command_logger.log_info("Discovery functionality not yet implemented.");
            }
            Commands::Overwatch => {
                command_logger.log_info("System overwatch functionality started.");

                // Specify the output file path for CPU statistics
                let output_file_path = "cpu_stats.txt";

                // Spawn a new thread to run the process monitoring task
                // This allows the Overwatch functionality to operate in the background
                // without blocking the main async executor
                std::thread::spawn(move || {
                    ps_adapter.collect_cpu_statistics(output_file_path);
                });

                command_logger.log_info("Monitoring CPU usage and top processes.");
            }
            Commands::DatabaseOps => {
                // Assuming `db_logger` is a reference to an implementation of `LoggerPort`
                command_logger.log_info("Database operations functionality not yet implemented.");

                match get_all_keys(logger.clone()) {
                    // Pass a reference, not a clone
                    Ok(_) => println!("Successfully retrieved all keys"),
                    Err(e) => eprintln!("Error retrieving keys: {:?}", e),
                }
            }
        }
    });

    // Initialize signal handling for graceful shutdown.
    let ctrl_c_signal = signal::ctrl_c();

    // Start the web server and await its completion.
    let server_handle = spawn(async move {
        // Start the web server and await its completion.
        if let Err(e) = web_server.start_server().await {
            // Log an error if the web server fails to start.
        }
    });

    // Await the completion of either the web server task or the Ctrl+C signal handling.
    // This is achieved using `tokio::select!`, which waits for multiple asynchronous
    // operations, proceeding when one of them completes. This is crucial for responsive
    // multitasking in asynchronous applications.
    // Await the completion of either the web server task or the Ctrl+C signal handling
    tokio::select! {
        _ = server_handle => {
            println!("Web server has stopped.");
        },
        _ = ctrl_c_handle => {
            println!("Shutdown initiated by Ctrl+C.");
        },
    }

    println!("Application is shutting down.");
    Ok(())
}

/// Retrieves all keys from the Sled database.
///
/// This function attempts to open the Sled database and create an iterator over all key-value pairs.
/// It logs the process and counts the total number of keys found.
///
/// # Arguments
///
/// * `logger` - An Arc-wrapped LoggerPort trait object for logging.
///
/// # Returns
///
/// * `Result<(), sled::Error>` - Returns Ok(()) if successful, or an Err containing the sled::Error if an error occurred.
fn get_all_keys(logger: Arc<dyn LoggerPort>) -> Result<(), sled::Error> {
    // Log the attempt to open the Sled database.
    logger.log_info("Attempting to open the Sled database.");

    // Attempt to open the Sled database, gracefully handling errors.
    let db = match sled::open("commandant-rs_database_file.db") {
        Ok(db) => {
            // Log the successful opening of the database.
            logger.log_info("Database opened successfully.");
            db
        }
        Err(e) => {
            // Log the error and return it if the database fails to open.
            logger.log_error(&format!("Error opening database: {}", e));
            return Err(e);
        }
    };

    // Log the creation of an iterator over all key-value pairs in the database.
    logger.log_debug("Creating an iterator over all key-value pairs in the database.");

    // Create an iterator over all key-value pairs in the database.
    let mut iter = db.iter();
    let mut key_count = 0;

    // Iterate over all keys.
    while let Some(result) = iter.next() {
        match result {
            Ok((key, _)) => {
                // Increment key count.
                key_count += 1;

                // Log each key.
                logger.log_debug(&format!("Key: {:?}", key));
            }
            Err(e) => {
                // Log the error and return it if an error occurs while iterating over the keys.
                logger.log_error(&format!("Error iterating over keys: {}", e));
                return Err(e);
            }
        }
    }

    // Log the total number of keys found.
    logger.log_info(&format!(
        "Successfully iterated over all keys. Total keys found: {}",
        key_count
    ));

    Ok(())
}
