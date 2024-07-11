; ModuleID = 'probe1.b316f6013465d776-cgu.0'
source_filename = "probe1.b316f6013465d776-cgu.0"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.12.0"

%"core::fmt::rt::Argument<'_>" = type { %"core::fmt::rt::ArgumentType<'_>" }
%"core::fmt::rt::ArgumentType<'_>" = type { [1 x i64], ptr }

@alloc_8df0580a595a87d56789d20c7318e185 = private unnamed_addr constant <{ [166 x i8] }> <{ [166 x i8] c"unsafe precondition(s) violated: ptr::copy_nonoverlapping requires that both pointer arguments are aligned and non-null and the specified memory ranges do not overlap" }>, align 1
@0 = private unnamed_addr constant <{ [8 x i8], [8 x i8] }> <{ [8 x i8] zeroinitializer, [8 x i8] undef }>, align 8
@alloc_91c7fa63c3cfeaa3c795652d5cf060e4 = private unnamed_addr constant <{ [12 x i8] }> <{ [12 x i8] c"invalid args" }>, align 1
@alloc_af99043bc04c419363a7f04d23183506 = private unnamed_addr constant <{ ptr, [8 x i8] }> <{ ptr @alloc_91c7fa63c3cfeaa3c795652d5cf060e4, [8 x i8] c"\0C\00\00\00\00\00\00\00" }>, align 8
@alloc_f93ec54d5f8967ace27e16fb5cbd0974 = private unnamed_addr constant <{ [75 x i8] }> <{ [75 x i8] c"/rustc/129f3b9964af4d4a709d1383930ade12dfe7c081/library/core/src/fmt/mod.rs" }>, align 1
@alloc_88b186b294e1df09aed40443e458fdff = private unnamed_addr constant <{ ptr, [16 x i8] }> <{ ptr @alloc_f93ec54d5f8967ace27e16fb5cbd0974, [16 x i8] c"K\00\00\00\00\00\00\00U\01\00\00\0D\00\00\00" }>, align 8
@alloc_d4d2a2a8539eafc62756407d946babb3 = private unnamed_addr constant <{ [110 x i8] }> <{ [110 x i8] c"unsafe precondition(s) violated: ptr::read_volatile requires that the pointer argument is aligned and non-null" }>, align 1
@alloc_20b3d155afd5c58c42e598b7e6d186ef = private unnamed_addr constant <{ [93 x i8] }> <{ [93 x i8] c"unsafe precondition(s) violated: NonNull::new_unchecked requires that the pointer is non-null" }>, align 1
@alloc_773eb6089c5345b558b6e9b46acd32c7 = private unnamed_addr constant <{ [80 x i8] }> <{ [80 x i8] c"/rustc/129f3b9964af4d4a709d1383930ade12dfe7c081/library/core/src/alloc/layout.rs" }>, align 1
@alloc_036741b78bbab5c773c8e8e5ccb52cfd = private unnamed_addr constant <{ ptr, [16 x i8] }> <{ ptr @alloc_773eb6089c5345b558b6e9b46acd32c7, [16 x i8] c"P\00\00\00\00\00\00\00\C3\01\00\00)\00\00\00" }>, align 8
@alloc_763310d78c99c2c1ad3f8a9821e942f3 = private unnamed_addr constant <{ [61 x i8] }> <{ [61 x i8] c"is_nonoverlapping: `size_of::<T>() * count` overflows a usize" }>, align 1
@alloc_fad0cd83b7d1858a846a172eb260e593 = private unnamed_addr constant <{ [42 x i8] }> <{ [42 x i8] c"is_aligned_to: align is not a power-of-two" }>, align 1
@alloc_041983ee8170efdaaf95ba67fd072d26 = private unnamed_addr constant <{ ptr, [8 x i8] }> <{ ptr @alloc_fad0cd83b7d1858a846a172eb260e593, [8 x i8] c"*\00\00\00\00\00\00\00" }>, align 8
@alloc_ceda132f29d7566153090be3080ad0f8 = private unnamed_addr constant <{ [81 x i8] }> <{ [81 x i8] c"/rustc/129f3b9964af4d4a709d1383930ade12dfe7c081/library/core/src/ptr/const_ptr.rs" }>, align 1
@alloc_46e10f51589822284a2f6f579093d0af = private unnamed_addr constant <{ ptr, [16 x i8] }> <{ ptr @alloc_ceda132f29d7566153090be3080ad0f8, [16 x i8] c"Q\00\00\00\00\00\00\00R\06\00\00\0D\00\00\00" }>, align 8
@__rust_no_alloc_shim_is_unstable = external global i8
@alloc_b99730e73100e73a81f4fbfe74b3821d = private unnamed_addr constant <{ ptr, [8 x i8] }> <{ ptr inttoptr (i64 1 to ptr), [8 x i8] zeroinitializer }>, align 8
@alloc_53973d2fe29b4adba8bb7390b5678745 = private unnamed_addr constant <{ [8 x i8] }> zeroinitializer, align 8

; core::intrinsics::copy_nonoverlapping::precondition_check
; Function Attrs: inlinehint nounwind uwtable
define internal void @_ZN4core10intrinsics19copy_nonoverlapping18precondition_check17h134d4e922289dc2eE(ptr %src, ptr %dst, i64 %size, i64 %align, i64 %count) unnamed_addr #0 personality ptr @rust_eh_personality {
start:
; invoke core::ub_checks::is_aligned_and_not_null
  %_6 = invoke zeroext i1 @_ZN4core9ub_checks23is_aligned_and_not_null17h20a79d37a24218dcE(ptr %src, i64 %align)
          to label %bb1 unwind label %terminate

terminate:                                        ; preds = %bb4, %bb2, %start
  %0 = landingpad { ptr, i32 }
          filter [0 x ptr] zeroinitializer
  %1 = extractvalue { ptr, i32 } %0, 0
  %2 = extractvalue { ptr, i32 } %0, 1
; call core::panicking::panic_cannot_unwind
  call void @_ZN4core9panicking19panic_cannot_unwind17h401f2f14e6a799e4E() #13
  unreachable

bb1:                                              ; preds = %start
  br i1 %_6, label %bb2, label %bb7

bb7:                                              ; preds = %bb6, %bb3, %bb1
; call core::panicking::panic_nounwind
  call void @_ZN4core9panicking14panic_nounwind17h856b80db4f3d28f3E(ptr align 1 @alloc_8df0580a595a87d56789d20c7318e185, i64 166) #14
  unreachable

bb2:                                              ; preds = %bb1
; invoke core::ub_checks::is_aligned_and_not_null
  %_7 = invoke zeroext i1 @_ZN4core9ub_checks23is_aligned_and_not_null17h20a79d37a24218dcE(ptr %dst, i64 %align)
          to label %bb3 unwind label %terminate

bb3:                                              ; preds = %bb2
  br i1 %_7, label %bb4, label %bb7

bb4:                                              ; preds = %bb3
; invoke core::ub_checks::is_nonoverlapping::runtime
  %_9 = invoke zeroext i1 @_ZN4core9ub_checks17is_nonoverlapping7runtime17hef6f19d01287c707E(ptr %src, ptr %dst, i64 %size, i64 %count)
          to label %bb8 unwind label %terminate

bb8:                                              ; preds = %bb4
  br i1 %_9, label %bb5, label %bb6

bb6:                                              ; preds = %bb8
  br label %bb7

bb5:                                              ; preds = %bb8
  ret void
}

; core::intrinsics::unlikely
; Function Attrs: nounwind uwtable
define internal zeroext i1 @_ZN4core10intrinsics8unlikely17h733859bde5438a2aE(i1 zeroext %b) unnamed_addr #1 {
start:
  ret i1 %b
}

; core::fmt::Arguments::new_v1
; Function Attrs: inlinehint uwtable
define internal void @_ZN4core3fmt9Arguments6new_v117h295711031c897e25E(ptr sret([48 x i8]) align 8 %_0, ptr align 8 %pieces.0, i64 %pieces.1, ptr align 8 %args.0, i64 %args.1) unnamed_addr #2 {
start:
  %_9 = alloca [48 x i8], align 8
  %_3 = icmp ult i64 %pieces.1, %args.1
  br i1 %_3, label %bb3, label %bb1

bb1:                                              ; preds = %start
  %_7 = add i64 %args.1, 1
  %_6 = icmp ugt i64 %pieces.1, %_7
  br i1 %_6, label %bb2, label %bb4

bb3:                                              ; preds = %bb2, %start
  store ptr @alloc_af99043bc04c419363a7f04d23183506, ptr %_9, align 8
  %0 = getelementptr inbounds i8, ptr %_9, i64 8
  store i64 1, ptr %0, align 8
  %1 = load ptr, ptr @0, align 8
  %2 = load i64, ptr getelementptr inbounds (i8, ptr @0, i64 8), align 8
  %3 = getelementptr inbounds i8, ptr %_9, i64 32
  store ptr %1, ptr %3, align 8
  %4 = getelementptr inbounds i8, ptr %3, i64 8
  store i64 %2, ptr %4, align 8
  %5 = getelementptr inbounds i8, ptr %_9, i64 16
  store ptr inttoptr (i64 8 to ptr), ptr %5, align 8
  %6 = getelementptr inbounds i8, ptr %5, i64 8
  store i64 0, ptr %6, align 8
; call core::panicking::panic_fmt
  call void @_ZN4core9panicking9panic_fmt17h72f2c0a769dd0f27E(ptr align 8 %_9, ptr align 8 @alloc_88b186b294e1df09aed40443e458fdff) #15
  unreachable

bb4:                                              ; preds = %bb1
  store ptr %pieces.0, ptr %_0, align 8
  %7 = getelementptr inbounds i8, ptr %_0, i64 8
  store i64 %pieces.1, ptr %7, align 8
  %8 = load ptr, ptr @0, align 8
  %9 = load i64, ptr getelementptr inbounds (i8, ptr @0, i64 8), align 8
  %10 = getelementptr inbounds i8, ptr %_0, i64 32
  store ptr %8, ptr %10, align 8
  %11 = getelementptr inbounds i8, ptr %10, i64 8
  store i64 %9, ptr %11, align 8
  %12 = getelementptr inbounds i8, ptr %_0, i64 16
  store ptr %args.0, ptr %12, align 8
  %13 = getelementptr inbounds i8, ptr %12, i64 8
  store i64 %args.1, ptr %13, align 8
  ret void

bb2:                                              ; preds = %bb1
  br label %bb3
}

; core::ops::function::FnOnce::call_once
; Function Attrs: inlinehint uwtable
define internal void @_ZN4core3ops8function6FnOnce9call_once17h4c09475e7f763491E(ptr sret([24 x i8]) align 8 %_0, ptr align 1 %0, i64 %1) unnamed_addr #2 {
start:
  %_2 = alloca [16 x i8], align 8
  store ptr %0, ptr %_2, align 8
  %2 = getelementptr inbounds i8, ptr %_2, i64 8
  store i64 %1, ptr %2, align 8
  %3 = load ptr, ptr %_2, align 8
  %4 = getelementptr inbounds i8, ptr %_2, i64 8
  %5 = load i64, ptr %4, align 8
; call alloc::str::<impl alloc::borrow::ToOwned for str>::to_owned
  call void @"_ZN5alloc3str56_$LT$impl$u20$alloc..borrow..ToOwned$u20$for$u20$str$GT$8to_owned17h5028cd58d1129345E"(ptr sret([24 x i8]) align 8 %_0, ptr align 1 %3, i64 %5)
  ret void
}

; core::ptr::read_volatile::precondition_check
; Function Attrs: inlinehint nounwind uwtable
define internal void @_ZN4core3ptr13read_volatile18precondition_check17hf791bd283913a916E(ptr %addr, i64 %align) unnamed_addr #0 personality ptr @rust_eh_personality {
start:
; invoke core::ub_checks::is_aligned_and_not_null
  %_3 = invoke zeroext i1 @_ZN4core9ub_checks23is_aligned_and_not_null17h20a79d37a24218dcE(ptr %addr, i64 %align)
          to label %bb1 unwind label %terminate

terminate:                                        ; preds = %start
  %0 = landingpad { ptr, i32 }
          filter [0 x ptr] zeroinitializer
  %1 = extractvalue { ptr, i32 } %0, 0
  %2 = extractvalue { ptr, i32 } %0, 1
; call core::panicking::panic_cannot_unwind
  call void @_ZN4core9panicking19panic_cannot_unwind17h401f2f14e6a799e4E() #13
  unreachable

bb1:                                              ; preds = %start
  br i1 %_3, label %bb2, label %bb3

bb3:                                              ; preds = %bb1
; call core::panicking::panic_nounwind
  call void @_ZN4core9panicking14panic_nounwind17h856b80db4f3d28f3E(ptr align 1 @alloc_d4d2a2a8539eafc62756407d946babb3, i64 110) #14
  unreachable

bb2:                                              ; preds = %bb1
  ret void
}

; core::ptr::drop_in_place<alloc::string::String>
; Function Attrs: uwtable
define void @"_ZN4core3ptr42drop_in_place$LT$alloc..string..String$GT$17hec0510b24c0b639bE"(ptr align 8 %_1) unnamed_addr #3 {
start:
; call core::ptr::drop_in_place<alloc::vec::Vec<u8>>
  call void @"_ZN4core3ptr46drop_in_place$LT$alloc..vec..Vec$LT$u8$GT$$GT$17h9357db362c379e4bE"(ptr align 8 %_1)
  ret void
}

; core::ptr::drop_in_place<alloc::vec::Vec<u8>>
; Function Attrs: uwtable
define void @"_ZN4core3ptr46drop_in_place$LT$alloc..vec..Vec$LT$u8$GT$$GT$17h9357db362c379e4bE"(ptr align 8 %_1) unnamed_addr #3 personality ptr @rust_eh_personality {
start:
  %0 = alloca [16 x i8], align 8
; invoke <alloc::vec::Vec<T,A> as core::ops::drop::Drop>::drop
  invoke void @"_ZN70_$LT$alloc..vec..Vec$LT$T$C$A$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h619af340555edd2aE"(ptr align 8 %_1)
          to label %bb4 unwind label %cleanup

bb3:                                              ; preds = %cleanup
; invoke core::ptr::drop_in_place<alloc::raw_vec::RawVec<u8>>
  invoke void @"_ZN4core3ptr53drop_in_place$LT$alloc..raw_vec..RawVec$LT$u8$GT$$GT$17he0b02e01f7be3eecE"(ptr align 8 %_1) #16
          to label %bb1 unwind label %terminate

cleanup:                                          ; preds = %start
  %1 = landingpad { ptr, i32 }
          cleanup
  %2 = extractvalue { ptr, i32 } %1, 0
  %3 = extractvalue { ptr, i32 } %1, 1
  store ptr %2, ptr %0, align 8
  %4 = getelementptr inbounds i8, ptr %0, i64 8
  store i32 %3, ptr %4, align 8
  br label %bb3

bb4:                                              ; preds = %start
; call core::ptr::drop_in_place<alloc::raw_vec::RawVec<u8>>
  call void @"_ZN4core3ptr53drop_in_place$LT$alloc..raw_vec..RawVec$LT$u8$GT$$GT$17he0b02e01f7be3eecE"(ptr align 8 %_1)
  ret void

terminate:                                        ; preds = %bb3
  %5 = landingpad { ptr, i32 }
          filter [0 x ptr] zeroinitializer
  %6 = extractvalue { ptr, i32 } %5, 0
  %7 = extractvalue { ptr, i32 } %5, 1
; call core::panicking::panic_in_cleanup
  call void @_ZN4core9panicking16panic_in_cleanup17h6a54550873acb036E() #13
  unreachable

bb1:                                              ; preds = %bb3
  %8 = load ptr, ptr %0, align 8
  %9 = getelementptr inbounds i8, ptr %0, i64 8
  %10 = load i32, ptr %9, align 8
  %11 = insertvalue { ptr, i32 } poison, ptr %8, 0
  %12 = insertvalue { ptr, i32 } %11, i32 %10, 1
  resume { ptr, i32 } %12
}

; core::ptr::drop_in_place<alloc::raw_vec::RawVec<u8>>
; Function Attrs: uwtable
define void @"_ZN4core3ptr53drop_in_place$LT$alloc..raw_vec..RawVec$LT$u8$GT$$GT$17he0b02e01f7be3eecE"(ptr align 8 %_1) unnamed_addr #3 {
start:
; call <alloc::raw_vec::RawVec<T,A> as core::ops::drop::Drop>::drop
  call void @"_ZN77_$LT$alloc..raw_vec..RawVec$LT$T$C$A$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17hb9cce7cdd0f911bbE"(ptr align 8 %_1)
  ret void
}

; core::ptr::non_null::NonNull<T>::new_unchecked::precondition_check
; Function Attrs: inlinehint nounwind uwtable
define internal void @"_ZN4core3ptr8non_null16NonNull$LT$T$GT$13new_unchecked18precondition_check17h750af6f0ffcc66f5E"(ptr %ptr) unnamed_addr #0 {
start:
  %_4 = ptrtoint ptr %ptr to i64
  %0 = icmp eq i64 %_4, 0
  br i1 %0, label %bb1, label %bb2

bb1:                                              ; preds = %start
; call core::panicking::panic_nounwind
  call void @_ZN4core9panicking14panic_nounwind17h856b80db4f3d28f3E(ptr align 1 @alloc_20b3d155afd5c58c42e598b7e6d186ef, i64 93) #14
  unreachable

bb2:                                              ; preds = %start
  ret void
}

; core::alloc::layout::Layout::array::inner
; Function Attrs: inlinehint uwtable
define internal { i64, i64 } @_ZN4core5alloc6layout6Layout5array5inner17hc71774f7f7a3fd10E(i64 %element_size, i64 %align, i64 %n) unnamed_addr #2 {
start:
  %_18 = alloca [8 x i8], align 8
  %_13 = alloca [8 x i8], align 8
  %_9 = alloca [16 x i8], align 8
  %_0 = alloca [16 x i8], align 8
  %0 = icmp eq i64 %element_size, 0
  br i1 %0, label %bb5, label %bb1

bb5:                                              ; preds = %bb4, %start
  %array_size = mul nuw i64 %element_size, %n
  store i64 %align, ptr %_18, align 8
  %_19 = load i64, ptr %_18, align 8
  %_20 = icmp uge i64 %_19, 1
  %_21 = icmp ule i64 %_19, -9223372036854775808
  %_22 = and i1 %_20, %_21
  %1 = getelementptr inbounds i8, ptr %_9, i64 8
  store i64 %array_size, ptr %1, align 8
  store i64 %_19, ptr %_9, align 8
  %2 = load i64, ptr %_9, align 8
  %3 = getelementptr inbounds i8, ptr %_9, i64 8
  %4 = load i64, ptr %3, align 8
  store i64 %2, ptr %_0, align 8
  %5 = getelementptr inbounds i8, ptr %_0, i64 8
  store i64 %4, ptr %5, align 8
  br label %bb6

bb1:                                              ; preds = %start
  store i64 %align, ptr %_13, align 8
  %_14 = load i64, ptr %_13, align 8
  %_15 = icmp uge i64 %_14, 1
  %_16 = icmp ule i64 %_14, -9223372036854775808
  %_17 = and i1 %_15, %_16
  %_11 = sub i64 %_14, 1
  %_6 = sub i64 9223372036854775807, %_11
  %_7 = icmp eq i64 %element_size, 0
  %6 = call i1 @llvm.expect.i1(i1 %_7, i1 false)
  br i1 %6, label %panic, label %bb2

bb2:                                              ; preds = %bb1
  %_5 = udiv i64 %_6, %element_size
  %_4 = icmp ugt i64 %n, %_5
  br i1 %_4, label %bb3, label %bb4

panic:                                            ; preds = %bb1
; call core::panicking::panic_const::panic_const_div_by_zero
  call void @_ZN4core9panicking11panic_const23panic_const_div_by_zero17h9f160465a6c74d4aE(ptr align 8 @alloc_036741b78bbab5c773c8e8e5ccb52cfd) #15
  unreachable

bb4:                                              ; preds = %bb2
  br label %bb5

bb3:                                              ; preds = %bb2
  %7 = load i64, ptr @0, align 8
  %8 = load i64, ptr getelementptr inbounds (i8, ptr @0, i64 8), align 8
  store i64 %7, ptr %_0, align 8
  %9 = getelementptr inbounds i8, ptr %_0, i64 8
  store i64 %8, ptr %9, align 8
  br label %bb6

bb6:                                              ; preds = %bb3, %bb5
  %10 = load i64, ptr %_0, align 8
  %11 = getelementptr inbounds i8, ptr %_0, i64 8
  %12 = load i64, ptr %11, align 8
  %13 = insertvalue { i64, i64 } poison, i64 %10, 0
  %14 = insertvalue { i64, i64 } %13, i64 %12, 1
  ret { i64, i64 } %14
}

; core::alloc::layout::Layout::dangling
; Function Attrs: inlinehint uwtable
define internal ptr @_ZN4core5alloc6layout6Layout8dangling17hf73e2490a9fd202dE(ptr align 8 %self) unnamed_addr #2 {
start:
  %_5 = alloca [8 x i8], align 8
  %_0 = alloca [8 x i8], align 8
  %self1 = load i64, ptr %self, align 8
  store i64 %self1, ptr %_5, align 8
  %_6 = load i64, ptr %_5, align 8
  %_7 = icmp uge i64 %_6, 1
  %_8 = icmp ule i64 %_6, -9223372036854775808
  %_9 = and i1 %_7, %_8
  %ptr = getelementptr i8, ptr null, i64 %_6
  br label %bb1

bb1:                                              ; preds = %start
; call core::ptr::non_null::NonNull<T>::new_unchecked::precondition_check
  call void @"_ZN4core3ptr8non_null16NonNull$LT$T$GT$13new_unchecked18precondition_check17h750af6f0ffcc66f5E"(ptr %ptr) #17
  br label %bb3

bb3:                                              ; preds = %bb1
  store ptr %ptr, ptr %_0, align 8
  %0 = load ptr, ptr %_0, align 8
  ret ptr %0
}

; core::option::Option<T>::map_or_else
; Function Attrs: inlinehint uwtable
define void @"_ZN4core6option15Option$LT$T$GT$11map_or_else17h242284d2cddb1f2eE"(ptr sret([24 x i8]) align 8 %_0, ptr align 1 %0, i64 %1, ptr align 8 %default) unnamed_addr #2 personality ptr @rust_eh_personality {
start:
  %2 = alloca [16 x i8], align 8
  %_10 = alloca [1 x i8], align 1
  %_9 = alloca [1 x i8], align 1
  %_7 = alloca [16 x i8], align 8
  %self = alloca [16 x i8], align 8
  store ptr %0, ptr %self, align 8
  %3 = getelementptr inbounds i8, ptr %self, i64 8
  store i64 %1, ptr %3, align 8
  store i8 1, ptr %_10, align 1
  store i8 1, ptr %_9, align 1
  %4 = load ptr, ptr %self, align 8
  %5 = ptrtoint ptr %4 to i64
  %6 = icmp eq i64 %5, 0
  %_4 = select i1 %6, i64 0, i64 1
  %7 = icmp eq i64 %_4, 0
  br i1 %7, label %bb2, label %bb3

bb2:                                              ; preds = %start
  store i8 0, ptr %_10, align 1
; invoke alloc::fmt::format::{{closure}}
  invoke void @"_ZN5alloc3fmt6format28_$u7b$$u7b$closure$u7d$$u7d$17h71087fabc58cba9fE"(ptr sret([24 x i8]) align 8 %_0, ptr align 8 %default)
          to label %bb5 unwind label %cleanup

bb3:                                              ; preds = %start
  %t.0 = load ptr, ptr %self, align 8
  %8 = getelementptr inbounds i8, ptr %self, i64 8
  %t.1 = load i64, ptr %8, align 8
  store i8 0, ptr %_9, align 1
  store ptr %t.0, ptr %_7, align 8
  %9 = getelementptr inbounds i8, ptr %_7, i64 8
  store i64 %t.1, ptr %9, align 8
  %10 = load ptr, ptr %_7, align 8
  %11 = getelementptr inbounds i8, ptr %_7, i64 8
  %12 = load i64, ptr %11, align 8
; invoke core::ops::function::FnOnce::call_once
  invoke void @_ZN4core3ops8function6FnOnce9call_once17h4c09475e7f763491E(ptr sret([24 x i8]) align 8 %_0, ptr align 1 %10, i64 %12)
          to label %bb4 unwind label %cleanup

bb11:                                             ; preds = %cleanup
  %13 = load i8, ptr %_9, align 1
  %14 = trunc i8 %13 to i1
  br i1 %14, label %bb10, label %bb7

cleanup:                                          ; preds = %bb3, %bb2
  %15 = landingpad { ptr, i32 }
          cleanup
  %16 = extractvalue { ptr, i32 } %15, 0
  %17 = extractvalue { ptr, i32 } %15, 1
  store ptr %16, ptr %2, align 8
  %18 = getelementptr inbounds i8, ptr %2, i64 8
  store i32 %17, ptr %18, align 8
  br label %bb11

bb5:                                              ; preds = %bb2
  br label %bb6

bb6:                                              ; preds = %bb9, %bb4, %bb5
  ret void

bb4:                                              ; preds = %bb3
  %19 = load i8, ptr %_10, align 1
  %20 = trunc i8 %19 to i1
  br i1 %20, label %bb9, label %bb6

bb9:                                              ; preds = %bb4
  br label %bb6

bb7:                                              ; preds = %bb10, %bb11
  %21 = load i8, ptr %_10, align 1
  %22 = trunc i8 %21 to i1
  br i1 %22, label %bb12, label %bb8

bb10:                                             ; preds = %bb11
  br label %bb7

bb8:                                              ; preds = %bb12, %bb7
  %23 = load ptr, ptr %2, align 8
  %24 = getelementptr inbounds i8, ptr %2, i64 8
  %25 = load i32, ptr %24, align 8
  %26 = insertvalue { ptr, i32 } poison, ptr %23, 0
  %27 = insertvalue { ptr, i32 } %26, i32 %25, 1
  resume { ptr, i32 } %27

bb12:                                             ; preds = %bb7
  br label %bb8

bb1:                                              ; No predecessors!
  unreachable
}

; core::ub_checks::is_nonoverlapping::runtime
; Function Attrs: inlinehint uwtable
define internal zeroext i1 @_ZN4core9ub_checks17is_nonoverlapping7runtime17hef6f19d01287c707E(ptr %src, ptr %dst, i64 %size, i64 %count) unnamed_addr #2 {
start:
  %0 = alloca [1 x i8], align 1
  %diff = alloca [8 x i8], align 8
  %_9 = alloca [16 x i8], align 8
  %src_usize = ptrtoint ptr %src to i64
  %dst_usize = ptrtoint ptr %dst to i64
  %1 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %size, i64 %count)
  %_15.0 = extractvalue { i64, i1 } %1, 0
  %_15.1 = extractvalue { i64, i1 } %1, 1
  %2 = call i1 @llvm.expect.i1(i1 %_15.1, i1 false)
  %3 = zext i1 %2 to i8
  store i8 %3, ptr %0, align 1
  %4 = load i8, ptr %0, align 1
  %_12 = trunc i8 %4 to i1
  br i1 %_12, label %bb2, label %bb3

bb3:                                              ; preds = %start
  %5 = getelementptr inbounds i8, ptr %_9, i64 8
  store i64 %_15.0, ptr %5, align 8
  store i64 1, ptr %_9, align 8
  %6 = getelementptr inbounds i8, ptr %_9, i64 8
  %size1 = load i64, ptr %6, align 8
  %_22 = icmp ult i64 %src_usize, %dst_usize
  br i1 %_22, label %bb4, label %bb5

bb2:                                              ; preds = %start
; call core::panicking::panic_nounwind
  call void @_ZN4core9panicking14panic_nounwind17h856b80db4f3d28f3E(ptr align 1 @alloc_763310d78c99c2c1ad3f8a9821e942f3, i64 61) #14
  unreachable

bb5:                                              ; preds = %bb3
  %7 = sub i64 %src_usize, %dst_usize
  store i64 %7, ptr %diff, align 8
  br label %bb6

bb4:                                              ; preds = %bb3
  %8 = sub i64 %dst_usize, %src_usize
  store i64 %8, ptr %diff, align 8
  br label %bb6

bb6:                                              ; preds = %bb4, %bb5
  %_11 = load i64, ptr %diff, align 8
  %_0 = icmp uge i64 %_11, %size1
  ret i1 %_0
}

; core::ub_checks::is_aligned_and_not_null
; Function Attrs: inlinehint uwtable
define internal zeroext i1 @_ZN4core9ub_checks23is_aligned_and_not_null17h20a79d37a24218dcE(ptr %ptr, i64 %align) unnamed_addr #2 {
start:
  %0 = alloca [4 x i8], align 4
  %_6 = alloca [48 x i8], align 8
  %_0 = alloca [1 x i8], align 1
  %_4 = ptrtoint ptr %ptr to i64
  %1 = icmp eq i64 %_4, 0
  br i1 %1, label %bb1, label %bb2

bb1:                                              ; preds = %start
  store i8 0, ptr %_0, align 1
  br label %bb3

bb2:                                              ; preds = %start
  %2 = call i64 @llvm.ctpop.i64(i64 %align)
  %3 = trunc i64 %2 to i32
  store i32 %3, ptr %0, align 4
  %_8 = load i32, ptr %0, align 4
  %4 = icmp eq i32 %_8, 1
  br i1 %4, label %bb4, label %bb5

bb3:                                              ; preds = %bb4, %bb1
  %5 = load i8, ptr %_0, align 1
  %6 = trunc i8 %5 to i1
  ret i1 %6

bb4:                                              ; preds = %bb2
  %_12 = sub i64 %align, 1
  %_11 = and i64 %_4, %_12
  %7 = icmp eq i64 %_11, 0
  %8 = zext i1 %7 to i8
  store i8 %8, ptr %_0, align 1
  br label %bb3

bb5:                                              ; preds = %bb2
  store ptr @alloc_041983ee8170efdaaf95ba67fd072d26, ptr %_6, align 8
  %9 = getelementptr inbounds i8, ptr %_6, i64 8
  store i64 1, ptr %9, align 8
  %10 = load ptr, ptr @0, align 8
  %11 = load i64, ptr getelementptr inbounds (i8, ptr @0, i64 8), align 8
  %12 = getelementptr inbounds i8, ptr %_6, i64 32
  store ptr %10, ptr %12, align 8
  %13 = getelementptr inbounds i8, ptr %12, i64 8
  store i64 %11, ptr %13, align 8
  %14 = getelementptr inbounds i8, ptr %_6, i64 16
  store ptr inttoptr (i64 8 to ptr), ptr %14, align 8
  %15 = getelementptr inbounds i8, ptr %14, i64 8
  store i64 0, ptr %15, align 8
; call core::panicking::panic_fmt
  call void @_ZN4core9panicking9panic_fmt17h72f2c0a769dd0f27E(ptr align 8 %_6, ptr align 8 @alloc_46e10f51589822284a2f6f579093d0af) #15
  unreachable
}

; <T as alloc::slice::hack::ConvertVec>::to_vec
; Function Attrs: inlinehint uwtable
define void @"_ZN52_$LT$T$u20$as$u20$alloc..slice..hack..ConvertVec$GT$6to_vec17h5870272084b2463cE"(ptr sret([24 x i8]) align 8 %_0, ptr align 1 %s.0, i64 %s.1) unnamed_addr #2 {
start:
  %_12 = alloca [24 x i8], align 8
  %v = alloca [24 x i8], align 8
; call alloc::raw_vec::RawVec<T,A>::try_allocate_in
  call void @"_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$15try_allocate_in17h4141ee35c68f8096E"(ptr sret([24 x i8]) align 8 %_12, i64 %s.1, i1 zeroext false)
  %_13 = load i64, ptr %_12, align 8
  %0 = icmp eq i64 %_13, 0
  br i1 %0, label %bb4, label %bb3

bb4:                                              ; preds = %start
  %1 = getelementptr inbounds i8, ptr %_12, i64 8
  %res.0 = load i64, ptr %1, align 8
  %2 = getelementptr inbounds i8, ptr %1, i64 8
  %res.1 = load ptr, ptr %2, align 8
  store i64 %res.0, ptr %v, align 8
  %3 = getelementptr inbounds i8, ptr %v, i64 8
  store ptr %res.1, ptr %3, align 8
  %4 = getelementptr inbounds i8, ptr %v, i64 16
  store i64 0, ptr %4, align 8
  %5 = getelementptr inbounds i8, ptr %v, i64 8
  %self = load ptr, ptr %5, align 8
  br label %bb5

bb3:                                              ; preds = %start
  %6 = getelementptr inbounds i8, ptr %_12, i64 8
  %err.0 = load i64, ptr %6, align 8
  %7 = getelementptr inbounds i8, ptr %6, i64 8
  %err.1 = load i64, ptr %7, align 8
; call alloc::raw_vec::handle_error
  call void @_ZN5alloc7raw_vec12handle_error17h802e3b59a685fb30E(i64 %err.0, i64 %err.1) #15
  unreachable

bb5:                                              ; preds = %bb4
; call core::intrinsics::copy_nonoverlapping::precondition_check
  call void @_ZN4core10intrinsics19copy_nonoverlapping18precondition_check17h134d4e922289dc2eE(ptr %s.0, ptr %self, i64 1, i64 1, i64 %s.1) #17
  br label %bb7

bb7:                                              ; preds = %bb5
  %8 = mul i64 %s.1, 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %self, ptr align 1 %s.0, i64 %8, i1 false)
  %9 = getelementptr inbounds i8, ptr %v, i64 16
  store i64 %s.1, ptr %9, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %_0, ptr align 8 %v, i64 24, i1 false)
  ret void

bb2:                                              ; No predecessors!
  unreachable
}

; alloc::fmt::format
; Function Attrs: inlinehint uwtable
define internal void @_ZN5alloc3fmt6format17hf069db35948e1b03E(ptr sret([24 x i8]) align 8 %_0, ptr align 8 %args) unnamed_addr #2 {
start:
  %_4 = alloca [8 x i8], align 8
  %_2 = alloca [16 x i8], align 8
  %_6.0 = load ptr, ptr %args, align 8
  %0 = getelementptr inbounds i8, ptr %args, i64 8
  %_6.1 = load i64, ptr %0, align 8
  %1 = getelementptr inbounds i8, ptr %args, i64 16
  %_7.0 = load ptr, ptr %1, align 8
  %2 = getelementptr inbounds i8, ptr %1, i64 8
  %_7.1 = load i64, ptr %2, align 8
  %3 = icmp eq i64 %_6.1, 0
  br i1 %3, label %bb4, label %bb5

bb4:                                              ; preds = %start
  %4 = icmp eq i64 %_7.1, 0
  br i1 %4, label %bb7, label %bb3

bb5:                                              ; preds = %start
  %5 = icmp eq i64 %_6.1, 1
  br i1 %5, label %bb6, label %bb3

bb7:                                              ; preds = %bb4
  store ptr inttoptr (i64 1 to ptr), ptr %_2, align 8
  %6 = getelementptr inbounds i8, ptr %_2, i64 8
  store i64 0, ptr %6, align 8
  br label %bb2

bb3:                                              ; preds = %bb6, %bb5, %bb4
  %7 = load ptr, ptr @0, align 8
  %8 = load i64, ptr getelementptr inbounds (i8, ptr @0, i64 8), align 8
  store ptr %7, ptr %_2, align 8
  %9 = getelementptr inbounds i8, ptr %_2, i64 8
  store i64 %8, ptr %9, align 8
  br label %bb2

bb2:                                              ; preds = %bb3, %bb8, %bb7
  store ptr %args, ptr %_4, align 8
  %10 = load ptr, ptr %_2, align 8
  %11 = getelementptr inbounds i8, ptr %_2, i64 8
  %12 = load i64, ptr %11, align 8
  %13 = load ptr, ptr %_4, align 8
; call core::option::Option<T>::map_or_else
  call void @"_ZN4core6option15Option$LT$T$GT$11map_or_else17h242284d2cddb1f2eE"(ptr sret([24 x i8]) align 8 %_0, ptr align 1 %10, i64 %12, ptr align 8 %13)
  ret void

bb6:                                              ; preds = %bb5
  %14 = icmp eq i64 %_7.1, 0
  br i1 %14, label %bb8, label %bb3

bb8:                                              ; preds = %bb6
  %s = getelementptr inbounds [0 x { ptr, i64 }], ptr %_6.0, i64 0, i64 0
  %15 = getelementptr inbounds [0 x { ptr, i64 }], ptr %_6.0, i64 0, i64 0
  %_13.0 = load ptr, ptr %15, align 8
  %16 = getelementptr inbounds i8, ptr %15, i64 8
  %_13.1 = load i64, ptr %16, align 8
  store ptr %_13.0, ptr %_2, align 8
  %17 = getelementptr inbounds i8, ptr %_2, i64 8
  store i64 %_13.1, ptr %17, align 8
  br label %bb2
}

; alloc::fmt::format::{{closure}}
; Function Attrs: inlinehint uwtable
define void @"_ZN5alloc3fmt6format28_$u7b$$u7b$closure$u7d$$u7d$17h71087fabc58cba9fE"(ptr sret([24 x i8]) align 8 %_0, ptr align 8 %_1) unnamed_addr #2 {
start:
  %_2 = alloca [48 x i8], align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %_2, ptr align 8 %_1, i64 48, i1 false)
; call alloc::fmt::format::format_inner
  call void @_ZN5alloc3fmt6format12format_inner17h68857d6ae172448aE(ptr sret([24 x i8]) align 8 %_0, ptr align 8 %_2)
  ret void
}

; alloc::str::<impl alloc::borrow::ToOwned for str>::to_owned
; Function Attrs: inlinehint uwtable
define internal void @"_ZN5alloc3str56_$LT$impl$u20$alloc..borrow..ToOwned$u20$for$u20$str$GT$8to_owned17h5028cd58d1129345E"(ptr sret([24 x i8]) align 8 %_0, ptr align 1 %self.0, i64 %self.1) unnamed_addr #2 {
start:
  %bytes = alloca [24 x i8], align 8
; call <T as alloc::slice::hack::ConvertVec>::to_vec
  call void @"_ZN52_$LT$T$u20$as$u20$alloc..slice..hack..ConvertVec$GT$6to_vec17h5870272084b2463cE"(ptr sret([24 x i8]) align 8 %bytes, ptr align 1 %self.0, i64 %self.1)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %_0, ptr align 8 %bytes, i64 24, i1 false)
  ret void
}

; alloc::alloc::alloc
; Function Attrs: inlinehint uwtable
define internal ptr @_ZN5alloc5alloc5alloc17h15d8e45cc2ce824fE(i64 %0, i64 %1) unnamed_addr #2 {
start:
  %2 = alloca [1 x i8], align 1
  %_13 = alloca [8 x i8], align 8
  %layout = alloca [16 x i8], align 8
  store i64 %0, ptr %layout, align 8
  %3 = getelementptr inbounds i8, ptr %layout, i64 8
  store i64 %1, ptr %3, align 8
  br label %bb3

bb3:                                              ; preds = %start
; call core::ptr::read_volatile::precondition_check
  call void @_ZN4core3ptr13read_volatile18precondition_check17hf791bd283913a916E(ptr @__rust_no_alloc_shim_is_unstable, i64 1) #17
  br label %bb5

bb5:                                              ; preds = %bb3
  %4 = load volatile i8, ptr @__rust_no_alloc_shim_is_unstable, align 1
  store i8 %4, ptr %2, align 1
  %_2 = load i8, ptr %2, align 1
  %5 = getelementptr inbounds i8, ptr %layout, i64 8
  %_5 = load i64, ptr %5, align 8
  %self = load i64, ptr %layout, align 8
  store i64 %self, ptr %_13, align 8
  %_14 = load i64, ptr %_13, align 8
  %_15 = icmp uge i64 %_14, 1
  %_16 = icmp ule i64 %_14, -9223372036854775808
  %_17 = and i1 %_15, %_16
  %_0 = call ptr @__rust_alloc(i64 %_5, i64 %_14) #17
  ret ptr %_0
}

; alloc::alloc::Global::alloc_impl
; Function Attrs: inlinehint uwtable
define internal { ptr, i64 } @_ZN5alloc5alloc6Global10alloc_impl17h0de47f587c546f24E(ptr align 1 %self, i64 %0, i64 %1, i1 zeroext %zeroed) unnamed_addr #2 {
start:
  %_37 = alloca [8 x i8], align 8
  %_32 = alloca [8 x i8], align 8
  %_17 = alloca [16 x i8], align 8
  %self3 = alloca [8 x i8], align 8
  %self2 = alloca [8 x i8], align 8
  %_12 = alloca [8 x i8], align 8
  %layout1 = alloca [16 x i8], align 8
  %raw_ptr = alloca [8 x i8], align 8
  %_6 = alloca [16 x i8], align 8
  %_0 = alloca [16 x i8], align 8
  %layout = alloca [16 x i8], align 8
  store i64 %0, ptr %layout, align 8
  %2 = getelementptr inbounds i8, ptr %layout, i64 8
  store i64 %1, ptr %2, align 8
  %3 = getelementptr inbounds i8, ptr %layout, i64 8
  %size = load i64, ptr %3, align 8
  %4 = icmp eq i64 %size, 0
  br i1 %4, label %bb2, label %bb1

bb2:                                              ; preds = %start
; call core::alloc::layout::Layout::dangling
  %data = call ptr @_ZN4core5alloc6layout6Layout8dangling17hf73e2490a9fd202dE(ptr align 8 %layout)
  br label %bb9

bb1:                                              ; preds = %start
  br i1 %zeroed, label %bb4, label %bb5

bb9:                                              ; preds = %bb2
; call core::ptr::non_null::NonNull<T>::new_unchecked::precondition_check
  call void @"_ZN4core3ptr8non_null16NonNull$LT$T$GT$13new_unchecked18precondition_check17h750af6f0ffcc66f5E"(ptr %data) #17
  br label %bb11

bb11:                                             ; preds = %bb9
  store ptr %data, ptr %_6, align 8
  %5 = getelementptr inbounds i8, ptr %_6, i64 8
  store i64 0, ptr %5, align 8
  %6 = load ptr, ptr %_6, align 8
  %7 = getelementptr inbounds i8, ptr %_6, i64 8
  %8 = load i64, ptr %7, align 8
  store ptr %6, ptr %_0, align 8
  %9 = getelementptr inbounds i8, ptr %_0, i64 8
  store i64 %8, ptr %9, align 8
  br label %bb8

bb8:                                              ; preds = %bb19, %bb13, %bb11
  %10 = load ptr, ptr %_0, align 8
  %11 = getelementptr inbounds i8, ptr %_0, i64 8
  %12 = load i64, ptr %11, align 8
  %13 = insertvalue { ptr, i64 } poison, ptr %10, 0
  %14 = insertvalue { ptr, i64 } %13, i64 %12, 1
  ret { ptr, i64 } %14

bb5:                                              ; preds = %bb1
  %_11.0 = load i64, ptr %layout, align 8
  %15 = getelementptr inbounds i8, ptr %layout, i64 8
  %_11.1 = load i64, ptr %15, align 8
; call alloc::alloc::alloc
  %16 = call ptr @_ZN5alloc5alloc5alloc17h15d8e45cc2ce824fE(i64 %_11.0, i64 %_11.1)
  store ptr %16, ptr %raw_ptr, align 8
  br label %bb7

bb4:                                              ; preds = %bb1
  %17 = load i64, ptr %layout, align 8
  %18 = getelementptr inbounds i8, ptr %layout, i64 8
  %19 = load i64, ptr %18, align 8
  store i64 %17, ptr %layout1, align 8
  %20 = getelementptr inbounds i8, ptr %layout1, i64 8
  store i64 %19, ptr %20, align 8
  %21 = getelementptr inbounds i8, ptr %layout1, i64 8
  %_27 = load i64, ptr %21, align 8
  %self4 = load i64, ptr %layout1, align 8
  store i64 %self4, ptr %_32, align 8
  %_33 = load i64, ptr %_32, align 8
  %_34 = icmp uge i64 %_33, 1
  %_35 = icmp ule i64 %_33, -9223372036854775808
  %_36 = and i1 %_34, %_35
  %22 = call ptr @__rust_alloc_zeroed(i64 %_27, i64 %_33) #17
  store ptr %22, ptr %raw_ptr, align 8
  br label %bb7

bb7:                                              ; preds = %bb4, %bb5
  %ptr = load ptr, ptr %raw_ptr, align 8
  %_38 = ptrtoint ptr %ptr to i64
  %23 = icmp eq i64 %_38, 0
  br i1 %23, label %bb13, label %bb14

bb13:                                             ; preds = %bb7
  store ptr null, ptr %self3, align 8
  store ptr null, ptr %self2, align 8
  %24 = load ptr, ptr @0, align 8
  %25 = load i64, ptr getelementptr inbounds (i8, ptr @0, i64 8), align 8
  store ptr %24, ptr %_0, align 8
  %26 = getelementptr inbounds i8, ptr %_0, i64 8
  store i64 %25, ptr %26, align 8
  br label %bb8

bb14:                                             ; preds = %bb7
  br label %bb15

bb15:                                             ; preds = %bb14
; call core::ptr::non_null::NonNull<T>::new_unchecked::precondition_check
  call void @"_ZN4core3ptr8non_null16NonNull$LT$T$GT$13new_unchecked18precondition_check17h750af6f0ffcc66f5E"(ptr %ptr) #17
  br label %bb16

bb16:                                             ; preds = %bb15
  store ptr %ptr, ptr %_37, align 8
  %27 = load ptr, ptr %_37, align 8
  store ptr %27, ptr %self3, align 8
  %v = load ptr, ptr %self3, align 8
  store ptr %v, ptr %self2, align 8
  %v5 = load ptr, ptr %self2, align 8
  store ptr %v5, ptr %_12, align 8
  %ptr6 = load ptr, ptr %_12, align 8
  br label %bb17

bb17:                                             ; preds = %bb16
; call core::ptr::non_null::NonNull<T>::new_unchecked::precondition_check
  call void @"_ZN4core3ptr8non_null16NonNull$LT$T$GT$13new_unchecked18precondition_check17h750af6f0ffcc66f5E"(ptr %ptr6) #17
  br label %bb19

bb19:                                             ; preds = %bb17
  store ptr %ptr6, ptr %_17, align 8
  %28 = getelementptr inbounds i8, ptr %_17, i64 8
  store i64 %size, ptr %28, align 8
  %29 = load ptr, ptr %_17, align 8
  %30 = getelementptr inbounds i8, ptr %_17, i64 8
  %31 = load i64, ptr %30, align 8
  store ptr %29, ptr %_0, align 8
  %32 = getelementptr inbounds i8, ptr %_0, i64 8
  store i64 %31, ptr %32, align 8
  br label %bb8
}

; alloc::raw_vec::RawVec<T,A>::current_memory
; Function Attrs: uwtable
define void @"_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$14current_memory17hcb7b21c8858cb2fcE"(ptr sret([24 x i8]) align 8 %_0, ptr align 8 %self) unnamed_addr #3 {
start:
  %self1 = alloca [8 x i8], align 8
  %_9 = alloca [24 x i8], align 8
  %layout = alloca [16 x i8], align 8
  br label %bb1

bb1:                                              ; preds = %start
  %_3 = load i64, ptr %self, align 8
  %0 = icmp eq i64 %_3, 0
  br i1 %0, label %bb2, label %bb4

bb2:                                              ; preds = %bb1
  br label %bb3

bb4:                                              ; preds = %bb1
  %rhs = load i64, ptr %self, align 8
  %size = mul nuw i64 1, %rhs
  %1 = getelementptr inbounds i8, ptr %layout, i64 8
  store i64 %size, ptr %1, align 8
  store i64 1, ptr %layout, align 8
  %2 = getelementptr inbounds i8, ptr %self, i64 8
  %self2 = load ptr, ptr %2, align 8
  store ptr %self2, ptr %self1, align 8
  %3 = load ptr, ptr %self1, align 8
  store ptr %3, ptr %_9, align 8
  %4 = load i64, ptr %layout, align 8
  %5 = getelementptr inbounds i8, ptr %layout, i64 8
  %6 = load i64, ptr %5, align 8
  %7 = getelementptr inbounds i8, ptr %_9, i64 8
  store i64 %4, ptr %7, align 8
  %8 = getelementptr inbounds i8, ptr %7, i64 8
  store i64 %6, ptr %8, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %_0, ptr align 8 %_9, i64 24, i1 false)
  br label %bb5

bb3:                                              ; preds = %bb2
  %9 = getelementptr inbounds i8, ptr %_0, i64 8
  store i64 0, ptr %9, align 8
  br label %bb5

bb5:                                              ; preds = %bb3, %bb4
  ret void
}

; alloc::raw_vec::RawVec<T,A>::try_allocate_in
; Function Attrs: uwtable
define void @"_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$15try_allocate_in17h4141ee35c68f8096E"(ptr sret([24 x i8]) align 8 %_0, i64 %capacity, i1 zeroext %0) unnamed_addr #3 personality ptr @rust_eh_personality {
start:
  %1 = alloca [16 x i8], align 8
  %_29 = alloca [1 x i8], align 1
  %_27 = alloca [8 x i8], align 8
  %pointer = alloca [8 x i8], align 8
  %_25 = alloca [8 x i8], align 8
  %_24 = alloca [16 x i8], align 8
  %self = alloca [16 x i8], align 8
  %_21 = alloca [16 x i8], align 8
  %result = alloca [16 x i8], align 8
  %_8 = alloca [16 x i8], align 8
  %layout = alloca [16 x i8], align 8
  %alloc = alloca [0 x i8], align 1
  %init = alloca [1 x i8], align 1
  %2 = zext i1 %0 to i8
  store i8 %2, ptr %init, align 1
  store i8 1, ptr %_29, align 1
  br label %bb1

bb1:                                              ; preds = %start
  %3 = icmp eq i64 %capacity, 0
  br i1 %3, label %bb2, label %bb4

bb2:                                              ; preds = %bb1
  store i8 0, ptr %_29, align 1
; invoke alloc::raw_vec::RawVec<T,A>::new_in
  %4 = invoke { i64, ptr } @"_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$6new_in17h0b0aba4315b73942E"()
          to label %bb3 unwind label %cleanup

bb4:                                              ; preds = %bb1
; invoke core::alloc::layout::Layout::array::inner
  %5 = invoke { i64, i64 } @_ZN4core5alloc6layout6Layout5array5inner17hc71774f7f7a3fd10E(i64 1, i64 1, i64 %capacity)
          to label %bb21 unwind label %cleanup

bb20:                                             ; preds = %cleanup
  %6 = load i8, ptr %_29, align 1
  %7 = trunc i8 %6 to i1
  br i1 %7, label %bb19, label %bb18

cleanup:                                          ; preds = %bb2, %bb8, %bb9, %bb4
  %8 = landingpad { ptr, i32 }
          cleanup
  %9 = extractvalue { ptr, i32 } %8, 0
  %10 = extractvalue { ptr, i32 } %8, 1
  store ptr %9, ptr %1, align 8
  %11 = getelementptr inbounds i8, ptr %1, i64 8
  store i32 %10, ptr %11, align 8
  br label %bb20

bb21:                                             ; preds = %bb4
  %12 = extractvalue { i64, i64 } %5, 0
  %13 = extractvalue { i64, i64 } %5, 1
  store i64 %12, ptr %_8, align 8
  %14 = getelementptr inbounds i8, ptr %_8, i64 8
  store i64 %13, ptr %14, align 8
  %15 = load i64, ptr %_8, align 8
  %16 = icmp eq i64 %15, 0
  %_9 = select i1 %16, i64 1, i64 0
  %17 = icmp eq i64 %_9, 0
  br i1 %17, label %bb7, label %bb6

bb7:                                              ; preds = %bb21
  %layout.0 = load i64, ptr %_8, align 8
  %18 = getelementptr inbounds i8, ptr %_8, i64 8
  %layout.1 = load i64, ptr %18, align 8
  store i64 %layout.0, ptr %layout, align 8
  %19 = getelementptr inbounds i8, ptr %layout, i64 8
  store i64 %layout.1, ptr %19, align 8
  %20 = getelementptr inbounds i8, ptr %layout, i64 8
  %alloc_size = load i64, ptr %20, align 8
  %21 = load i8, ptr %init, align 1
  %22 = trunc i8 %21 to i1
  %_14 = zext i1 %22 to i64
  %23 = icmp eq i64 %_14, 0
  br i1 %23, label %bb9, label %bb8

bb6:                                              ; preds = %bb21
  %24 = load i64, ptr @0, align 8
  %25 = load i64, ptr getelementptr inbounds (i8, ptr @0, i64 8), align 8
  %26 = getelementptr inbounds i8, ptr %_0, i64 8
  store i64 %24, ptr %26, align 8
  %27 = getelementptr inbounds i8, ptr %26, i64 8
  store i64 %25, ptr %27, align 8
  store i64 1, ptr %_0, align 8
  br label %bb16

bb9:                                              ; preds = %bb7
  %_16.0 = load i64, ptr %layout, align 8
  %28 = getelementptr inbounds i8, ptr %layout, i64 8
  %_16.1 = load i64, ptr %28, align 8
; invoke <alloc::alloc::Global as core::alloc::Allocator>::allocate
  %29 = invoke { ptr, i64 } @"_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$8allocate17h1e858d5662c4bb4bE"(ptr align 1 %alloc, i64 %_16.0, i64 %_16.1)
          to label %bb10 unwind label %cleanup

bb8:                                              ; preds = %bb7
  %_18.0 = load i64, ptr %layout, align 8
  %30 = getelementptr inbounds i8, ptr %layout, i64 8
  %_18.1 = load i64, ptr %30, align 8
; invoke <alloc::alloc::Global as core::alloc::Allocator>::allocate_zeroed
  %31 = invoke { ptr, i64 } @"_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$15allocate_zeroed17hccb739b257089f5fE"(ptr align 1 %alloc, i64 %_18.0, i64 %_18.1)
          to label %bb11 unwind label %cleanup

bb10:                                             ; preds = %bb9
  %32 = extractvalue { ptr, i64 } %29, 0
  %33 = extractvalue { ptr, i64 } %29, 1
  store ptr %32, ptr %result, align 8
  %34 = getelementptr inbounds i8, ptr %result, i64 8
  store i64 %33, ptr %34, align 8
  br label %bb12

bb12:                                             ; preds = %bb11, %bb10
  %35 = load ptr, ptr %result, align 8
  %36 = ptrtoint ptr %35 to i64
  %37 = icmp eq i64 %36, 0
  %_19 = select i1 %37, i64 1, i64 0
  %38 = icmp eq i64 %_19, 0
  br i1 %38, label %bb14, label %bb13

bb11:                                             ; preds = %bb8
  %39 = extractvalue { ptr, i64 } %31, 0
  %40 = extractvalue { ptr, i64 } %31, 1
  store ptr %39, ptr %result, align 8
  %41 = getelementptr inbounds i8, ptr %result, i64 8
  store i64 %40, ptr %41, align 8
  br label %bb12

bb14:                                             ; preds = %bb12
  %ptr.0 = load ptr, ptr %result, align 8
  %42 = getelementptr inbounds i8, ptr %result, i64 8
  %ptr.1 = load i64, ptr %42, align 8
  store ptr %ptr.0, ptr %pointer, align 8
  %43 = load ptr, ptr %pointer, align 8
  store ptr %43, ptr %_25, align 8
  store i64 %capacity, ptr %_27, align 8
  %44 = load ptr, ptr %_25, align 8
  %45 = getelementptr inbounds i8, ptr %_24, i64 8
  store ptr %44, ptr %45, align 8
  %46 = load i64, ptr %_27, align 8
  store i64 %46, ptr %_24, align 8
  %47 = load i64, ptr %_24, align 8
  %48 = getelementptr inbounds i8, ptr %_24, i64 8
  %49 = load ptr, ptr %48, align 8
  %50 = getelementptr inbounds i8, ptr %_0, i64 8
  store i64 %47, ptr %50, align 8
  %51 = getelementptr inbounds i8, ptr %50, i64 8
  store ptr %49, ptr %51, align 8
  store i64 0, ptr %_0, align 8
  br label %bb15

bb13:                                             ; preds = %bb12
  %_23.0 = load i64, ptr %layout, align 8
  %52 = getelementptr inbounds i8, ptr %layout, i64 8
  %_23.1 = load i64, ptr %52, align 8
  store i64 %_23.0, ptr %self, align 8
  %53 = getelementptr inbounds i8, ptr %self, i64 8
  store i64 %_23.1, ptr %53, align 8
  %54 = load i64, ptr %self, align 8
  %55 = getelementptr inbounds i8, ptr %self, i64 8
  %56 = load i64, ptr %55, align 8
  store i64 %54, ptr %_21, align 8
  %57 = getelementptr inbounds i8, ptr %_21, i64 8
  store i64 %56, ptr %57, align 8
  %58 = load i64, ptr %_21, align 8
  %59 = getelementptr inbounds i8, ptr %_21, i64 8
  %60 = load i64, ptr %59, align 8
  %61 = getelementptr inbounds i8, ptr %_0, i64 8
  store i64 %58, ptr %61, align 8
  %62 = getelementptr inbounds i8, ptr %61, i64 8
  store i64 %60, ptr %62, align 8
  store i64 1, ptr %_0, align 8
  br label %bb16

bb15:                                             ; preds = %bb3, %bb14
  br label %bb17

bb16:                                             ; preds = %bb6, %bb13
  br label %bb17

bb17:                                             ; preds = %bb15, %bb16
  ret void

bb5:                                              ; No predecessors!
  unreachable

bb3:                                              ; preds = %bb2
  %_5.0 = extractvalue { i64, ptr } %4, 0
  %_5.1 = extractvalue { i64, ptr } %4, 1
  %63 = getelementptr inbounds i8, ptr %_0, i64 8
  store i64 %_5.0, ptr %63, align 8
  %64 = getelementptr inbounds i8, ptr %63, i64 8
  store ptr %_5.1, ptr %64, align 8
  store i64 0, ptr %_0, align 8
  br label %bb15

bb18:                                             ; preds = %bb19, %bb20
  %65 = load ptr, ptr %1, align 8
  %66 = getelementptr inbounds i8, ptr %1, i64 8
  %67 = load i32, ptr %66, align 8
  %68 = insertvalue { ptr, i32 } poison, ptr %65, 0
  %69 = insertvalue { ptr, i32 } %68, i32 %67, 1
  resume { ptr, i32 } %69

bb19:                                             ; preds = %bb20
  br label %bb18
}

; alloc::raw_vec::RawVec<T,A>::new_in
; Function Attrs: uwtable
define { i64, ptr } @"_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$6new_in17h0b0aba4315b73942E"() unnamed_addr #3 {
start:
  %_3 = alloca [8 x i8], align 8
  %_2 = alloca [8 x i8], align 8
  %_0 = alloca [16 x i8], align 8
  br label %bb1

bb1:                                              ; preds = %start
; call core::ptr::non_null::NonNull<T>::new_unchecked::precondition_check
  call void @"_ZN4core3ptr8non_null16NonNull$LT$T$GT$13new_unchecked18precondition_check17h750af6f0ffcc66f5E"(ptr getelementptr (i8, ptr null, i64 1)) #17
  br label %bb3

bb3:                                              ; preds = %bb1
  store ptr getelementptr (i8, ptr null, i64 1), ptr %_3, align 8
  %0 = load ptr, ptr %_3, align 8
  store ptr %0, ptr %_2, align 8
  %1 = load ptr, ptr %_2, align 8
  %2 = getelementptr inbounds i8, ptr %_0, i64 8
  store ptr %1, ptr %2, align 8
  store i64 0, ptr %_0, align 8
  %3 = load i64, ptr %_0, align 8
  %4 = getelementptr inbounds i8, ptr %_0, i64 8
  %5 = load ptr, ptr %4, align 8
  %6 = insertvalue { i64, ptr } poison, i64 %3, 0
  %7 = insertvalue { i64, ptr } %6, ptr %5, 1
  ret { i64, ptr } %7
}

; <alloc::alloc::Global as core::alloc::Allocator>::deallocate
; Function Attrs: inlinehint uwtable
define internal void @"_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$10deallocate17he5ced074f3ebf743E"(ptr align 1 %self, ptr %ptr, i64 %0, i64 %1) unnamed_addr #2 {
start:
  %_14 = alloca [8 x i8], align 8
  %layout1 = alloca [16 x i8], align 8
  %layout = alloca [16 x i8], align 8
  store i64 %0, ptr %layout, align 8
  %2 = getelementptr inbounds i8, ptr %layout, i64 8
  store i64 %1, ptr %2, align 8
  %3 = getelementptr inbounds i8, ptr %layout, i64 8
  %_4 = load i64, ptr %3, align 8
  %4 = icmp eq i64 %_4, 0
  br i1 %4, label %bb2, label %bb1

bb2:                                              ; preds = %start
  br label %bb3

bb1:                                              ; preds = %start
  %5 = load i64, ptr %layout, align 8
  %6 = getelementptr inbounds i8, ptr %layout, i64 8
  %7 = load i64, ptr %6, align 8
  store i64 %5, ptr %layout1, align 8
  %8 = getelementptr inbounds i8, ptr %layout1, i64 8
  store i64 %7, ptr %8, align 8
  %9 = getelementptr inbounds i8, ptr %layout1, i64 8
  %_9 = load i64, ptr %9, align 8
  %self2 = load i64, ptr %layout1, align 8
  store i64 %self2, ptr %_14, align 8
  %_15 = load i64, ptr %_14, align 8
  %_16 = icmp uge i64 %_15, 1
  %_17 = icmp ule i64 %_15, -9223372036854775808
  %_18 = and i1 %_16, %_17
  call void @__rust_dealloc(ptr %ptr, i64 %_9, i64 %_15) #17
  br label %bb3

bb3:                                              ; preds = %bb1, %bb2
  ret void
}

; <alloc::alloc::Global as core::alloc::Allocator>::allocate_zeroed
; Function Attrs: inlinehint uwtable
define internal { ptr, i64 } @"_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$15allocate_zeroed17hccb739b257089f5fE"(ptr align 1 %self, i64 %layout.0, i64 %layout.1) unnamed_addr #2 {
start:
; call alloc::alloc::Global::alloc_impl
  %0 = call { ptr, i64 } @_ZN5alloc5alloc6Global10alloc_impl17h0de47f587c546f24E(ptr align 1 %self, i64 %layout.0, i64 %layout.1, i1 zeroext true)
  %_0.0 = extractvalue { ptr, i64 } %0, 0
  %_0.1 = extractvalue { ptr, i64 } %0, 1
  %1 = insertvalue { ptr, i64 } poison, ptr %_0.0, 0
  %2 = insertvalue { ptr, i64 } %1, i64 %_0.1, 1
  ret { ptr, i64 } %2
}

; <alloc::alloc::Global as core::alloc::Allocator>::allocate
; Function Attrs: inlinehint uwtable
define internal { ptr, i64 } @"_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$8allocate17h1e858d5662c4bb4bE"(ptr align 1 %self, i64 %layout.0, i64 %layout.1) unnamed_addr #2 {
start:
; call alloc::alloc::Global::alloc_impl
  %0 = call { ptr, i64 } @_ZN5alloc5alloc6Global10alloc_impl17h0de47f587c546f24E(ptr align 1 %self, i64 %layout.0, i64 %layout.1, i1 zeroext false)
  %_0.0 = extractvalue { ptr, i64 } %0, 0
  %_0.1 = extractvalue { ptr, i64 } %0, 1
  %1 = insertvalue { ptr, i64 } poison, ptr %_0.0, 0
  %2 = insertvalue { ptr, i64 } %1, i64 %_0.1, 1
  ret { ptr, i64 } %2
}

; <alloc::vec::Vec<T,A> as core::ops::drop::Drop>::drop
; Function Attrs: uwtable
define void @"_ZN70_$LT$alloc..vec..Vec$LT$T$C$A$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h619af340555edd2aE"(ptr align 8 %self) unnamed_addr #3 {
start:
  %0 = getelementptr inbounds i8, ptr %self, i64 8
  %self1 = load ptr, ptr %0, align 8
  %1 = getelementptr inbounds i8, ptr %self, i64 16
  %len = load i64, ptr %1, align 8
  ret void
}

; <alloc::raw_vec::RawVec<T,A> as core::ops::drop::Drop>::drop
; Function Attrs: uwtable
define void @"_ZN77_$LT$alloc..raw_vec..RawVec$LT$T$C$A$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17hb9cce7cdd0f911bbE"(ptr align 8 %self) unnamed_addr #3 {
start:
  %_2 = alloca [24 x i8], align 8
; call alloc::raw_vec::RawVec<T,A>::current_memory
  call void @"_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$14current_memory17hcb7b21c8858cb2fcE"(ptr sret([24 x i8]) align 8 %_2, ptr align 8 %self)
  %0 = getelementptr inbounds i8, ptr %_2, i64 8
  %1 = load i64, ptr %0, align 8
  %2 = icmp eq i64 %1, 0
  %_4 = select i1 %2, i64 0, i64 1
  %3 = icmp eq i64 %_4, 1
  br i1 %3, label %bb2, label %bb4

bb2:                                              ; preds = %start
  %ptr = load ptr, ptr %_2, align 8
  %4 = getelementptr inbounds i8, ptr %_2, i64 8
  %layout.0 = load i64, ptr %4, align 8
  %5 = getelementptr inbounds i8, ptr %4, i64 8
  %layout.1 = load i64, ptr %5, align 8
  %_7 = getelementptr inbounds i8, ptr %self, i64 16
; call <alloc::alloc::Global as core::alloc::Allocator>::deallocate
  call void @"_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$10deallocate17he5ced074f3ebf743E"(ptr align 1 %_7, ptr %ptr, i64 %layout.0, i64 %layout.1)
  br label %bb4

bb4:                                              ; preds = %bb2, %start
  ret void

bb5:                                              ; No predecessors!
  unreachable
}

; probe1::probe
; Function Attrs: uwtable
define void @_ZN6probe15probe17h092f94c8c3abeec6E() unnamed_addr #3 {
start:
  %_3.i = alloca [16 x i8], align 8
  %_8 = alloca [16 x i8], align 8
  %_7 = alloca [16 x i8], align 8
  %_3 = alloca [48 x i8], align 8
  %res = alloca [24 x i8], align 8
  %_1 = alloca [24 x i8], align 8
  store ptr @alloc_53973d2fe29b4adba8bb7390b5678745, ptr %_3.i, align 8
  %0 = getelementptr inbounds i8, ptr %_3.i, i64 8
  store ptr @"_ZN4core3fmt3num3imp55_$LT$impl$u20$core..fmt..LowerExp$u20$for$u20$isize$GT$3fmt17h482662f2086e94edE", ptr %0, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %_8, ptr align 8 %_3.i, i64 16, i1 false)
  %1 = getelementptr inbounds [1 x %"core::fmt::rt::Argument<'_>"], ptr %_7, i64 0, i64 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %1, ptr align 8 %_8, i64 16, i1 false)
; call core::fmt::Arguments::new_v1
  call void @_ZN4core3fmt9Arguments6new_v117h295711031c897e25E(ptr sret([48 x i8]) align 8 %_3, ptr align 8 @alloc_b99730e73100e73a81f4fbfe74b3821d, i64 1, ptr align 8 %_7, i64 1)
; call alloc::fmt::format
  call void @_ZN5alloc3fmt6format17hf069db35948e1b03E(ptr sret([24 x i8]) align 8 %res, ptr align 8 %_3)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %_1, ptr align 8 %res, i64 24, i1 false)
; call core::ptr::drop_in_place<alloc::string::String>
  call void @"_ZN4core3ptr42drop_in_place$LT$alloc..string..String$GT$17hec0510b24c0b639bE"(ptr align 8 %_1)
  ret void
}

; Function Attrs: uwtable
declare i32 @rust_eh_personality(i32, i32, i64, ptr, ptr) unnamed_addr #3

; core::panicking::panic_cannot_unwind
; Function Attrs: cold noinline noreturn nounwind uwtable
declare void @_ZN4core9panicking19panic_cannot_unwind17h401f2f14e6a799e4E() unnamed_addr #4

; core::panicking::panic_nounwind
; Function Attrs: cold noinline noreturn nounwind uwtable
declare void @_ZN4core9panicking14panic_nounwind17h856b80db4f3d28f3E(ptr align 1, i64) unnamed_addr #4

; core::fmt::num::imp::<impl core::fmt::LowerExp for isize>::fmt
; Function Attrs: uwtable
declare zeroext i1 @"_ZN4core3fmt3num3imp55_$LT$impl$u20$core..fmt..LowerExp$u20$for$u20$isize$GT$3fmt17h482662f2086e94edE"(ptr align 8, ptr align 8) unnamed_addr #3

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #5

; core::panicking::panic_fmt
; Function Attrs: cold noinline noreturn uwtable
declare void @_ZN4core9panicking9panic_fmt17h72f2c0a769dd0f27E(ptr align 8, ptr align 8) unnamed_addr #6

; core::panicking::panic_in_cleanup
; Function Attrs: cold noinline noreturn nounwind uwtable
declare void @_ZN4core9panicking16panic_in_cleanup17h6a54550873acb036E() unnamed_addr #4

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare i1 @llvm.expect.i1(i1, i1) #7

; core::panicking::panic_const::panic_const_div_by_zero
; Function Attrs: cold noinline noreturn uwtable
declare void @_ZN4core9panicking11panic_const23panic_const_div_by_zero17h9f160465a6c74d4aE(ptr align 8) unnamed_addr #6

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { i64, i1 } @llvm.umul.with.overflow.i64(i64, i64) #8

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.ctpop.i64(i64) #8

; alloc::raw_vec::handle_error
; Function Attrs: cold noreturn uwtable
declare void @_ZN5alloc7raw_vec12handle_error17h802e3b59a685fb30E(i64, i64) unnamed_addr #9

; alloc::fmt::format::format_inner
; Function Attrs: uwtable
declare void @_ZN5alloc3fmt6format12format_inner17h68857d6ae172448aE(ptr sret([24 x i8]) align 8, ptr align 8) unnamed_addr #3

; Function Attrs: nounwind allockind("alloc,uninitialized,aligned") allocsize(0) uwtable
declare noalias ptr @__rust_alloc(i64, i64 allocalign) unnamed_addr #10

; Function Attrs: nounwind allockind("alloc,zeroed,aligned") allocsize(0) uwtable
declare noalias ptr @__rust_alloc_zeroed(i64, i64 allocalign) unnamed_addr #11

; Function Attrs: nounwind allockind("free") uwtable
declare void @__rust_dealloc(ptr allocptr, i64, i64) unnamed_addr #12

attributes #0 = { inlinehint nounwind uwtable "frame-pointer"="all" "probe-stack"="inline-asm" "target-cpu"="penryn" }
attributes #1 = { nounwind uwtable "frame-pointer"="all" "probe-stack"="inline-asm" "target-cpu"="penryn" }
attributes #2 = { inlinehint uwtable "frame-pointer"="all" "probe-stack"="inline-asm" "target-cpu"="penryn" }
attributes #3 = { uwtable "frame-pointer"="all" "probe-stack"="inline-asm" "target-cpu"="penryn" }
attributes #4 = { cold noinline noreturn nounwind uwtable "frame-pointer"="all" "probe-stack"="inline-asm" "target-cpu"="penryn" }
attributes #5 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #6 = { cold noinline noreturn uwtable "frame-pointer"="all" "probe-stack"="inline-asm" "target-cpu"="penryn" }
attributes #7 = { nocallback nofree nosync nounwind willreturn memory(none) }
attributes #8 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #9 = { cold noreturn uwtable "frame-pointer"="all" "probe-stack"="inline-asm" "target-cpu"="penryn" }
attributes #10 = { nounwind allockind("alloc,uninitialized,aligned") allocsize(0) uwtable "alloc-family"="__rust_alloc" "frame-pointer"="all" "probe-stack"="inline-asm" "target-cpu"="penryn" }
attributes #11 = { nounwind allockind("alloc,zeroed,aligned") allocsize(0) uwtable "alloc-family"="__rust_alloc" "frame-pointer"="all" "probe-stack"="inline-asm" "target-cpu"="penryn" }
attributes #12 = { nounwind allockind("free") uwtable "alloc-family"="__rust_alloc" "frame-pointer"="all" "probe-stack"="inline-asm" "target-cpu"="penryn" }
attributes #13 = { cold noreturn nounwind }
attributes #14 = { noreturn nounwind }
attributes #15 = { noreturn }
attributes #16 = { cold }
attributes #17 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{!"rustc version 1.79.0 (129f3b996 2024-06-10)"}
