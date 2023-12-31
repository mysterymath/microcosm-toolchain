; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -verify-machineinstrs -mtriple=powerpc -mcpu=ppc32 < %s | FileCheck %s --check-prefix=PPC32
; RUN: llc -verify-machineinstrs -mtriple=powerpc64-unknown-linux-gnu -mcpu=pwr8 < %s | FileCheck %s
; RUN: llc -verify-machineinstrs -mtriple=powerpc64le-unknown-linux-gnu -mcpu=pwr8 < %s | FileCheck %s
declare i32 @llvm.bitreverse.i32(i32)
define i32 @testBitReverseIntrinsicI32(i32 %arg) {
; PPC32-LABEL: testBitReverseIntrinsicI32:
; PPC32:       # %bb.0:
; PPC32-NEXT:    lis 4, -21846
; PPC32-NEXT:    ori 4, 4, 43690
; PPC32-NEXT:    slwi 5, 3, 1
; PPC32-NEXT:    and 4, 5, 4
; PPC32-NEXT:    lis 5, 21845
; PPC32-NEXT:    ori 5, 5, 21845
; PPC32-NEXT:    srwi 3, 3, 1
; PPC32-NEXT:    and 3, 3, 5
; PPC32-NEXT:    lis 5, -13108
; PPC32-NEXT:    or 3, 3, 4
; PPC32-NEXT:    ori 5, 5, 52428
; PPC32-NEXT:    slwi 4, 3, 2
; PPC32-NEXT:    and 4, 4, 5
; PPC32-NEXT:    lis 5, 13107
; PPC32-NEXT:    ori 5, 5, 13107
; PPC32-NEXT:    srwi 3, 3, 2
; PPC32-NEXT:    and 3, 3, 5
; PPC32-NEXT:    lis 5, -3856
; PPC32-NEXT:    or 3, 3, 4
; PPC32-NEXT:    ori 5, 5, 61680
; PPC32-NEXT:    slwi 4, 3, 4
; PPC32-NEXT:    and 4, 4, 5
; PPC32-NEXT:    lis 5, 3855
; PPC32-NEXT:    ori 5, 5, 3855
; PPC32-NEXT:    srwi 3, 3, 4
; PPC32-NEXT:    and 3, 3, 5
; PPC32-NEXT:    or 4, 3, 4
; PPC32-NEXT:    rotlwi 3, 4, 24
; PPC32-NEXT:    rlwimi 3, 4, 8, 8, 15
; PPC32-NEXT:    rlwimi 3, 4, 8, 24, 31
; PPC32-NEXT:    blr
;
; CHECK-LABEL: testBitReverseIntrinsicI32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lis 4, -21846
; CHECK-NEXT:    slwi 5, 3, 1
; CHECK-NEXT:    srwi 3, 3, 1
; CHECK-NEXT:    ori 4, 4, 43690
; CHECK-NEXT:    and 4, 5, 4
; CHECK-NEXT:    lis 5, 21845
; CHECK-NEXT:    ori 5, 5, 21845
; CHECK-NEXT:    and 3, 3, 5
; CHECK-NEXT:    lis 5, -13108
; CHECK-NEXT:    or 3, 3, 4
; CHECK-NEXT:    ori 5, 5, 52428
; CHECK-NEXT:    slwi 4, 3, 2
; CHECK-NEXT:    srwi 3, 3, 2
; CHECK-NEXT:    and 4, 4, 5
; CHECK-NEXT:    lis 5, 13107
; CHECK-NEXT:    ori 5, 5, 13107
; CHECK-NEXT:    and 3, 3, 5
; CHECK-NEXT:    lis 5, -3856
; CHECK-NEXT:    or 3, 3, 4
; CHECK-NEXT:    ori 5, 5, 61680
; CHECK-NEXT:    slwi 4, 3, 4
; CHECK-NEXT:    srwi 3, 3, 4
; CHECK-NEXT:    and 4, 4, 5
; CHECK-NEXT:    lis 5, 3855
; CHECK-NEXT:    ori 5, 5, 3855
; CHECK-NEXT:    and 3, 3, 5
; CHECK-NEXT:    or 3, 3, 4
; CHECK-NEXT:    rotlwi 4, 3, 24
; CHECK-NEXT:    rlwimi 4, 3, 8, 8, 15
; CHECK-NEXT:    rlwimi 4, 3, 8, 24, 31
; CHECK-NEXT:    rldicl 3, 4, 0, 32
; CHECK-NEXT:    blr
  %res = call i32 @llvm.bitreverse.i32(i32 %arg)
  ret i32 %res
}

declare i64 @llvm.bitreverse.i64(i64)
define i64 @testBitReverseIntrinsicI64(i64 %arg) {
; PPC32-LABEL: testBitReverseIntrinsicI64:
; PPC32:       # %bb.0:
; PPC32-NEXT:    lis 5, -21846
; PPC32-NEXT:    lis 6, 21845
; PPC32-NEXT:    ori 5, 5, 43690
; PPC32-NEXT:    slwi 10, 4, 1
; PPC32-NEXT:    slwi 11, 3, 1
; PPC32-NEXT:    ori 6, 6, 21845
; PPC32-NEXT:    srwi 4, 4, 1
; PPC32-NEXT:    srwi 3, 3, 1
; PPC32-NEXT:    and 10, 10, 5
; PPC32-NEXT:    and 5, 11, 5
; PPC32-NEXT:    and 4, 4, 6
; PPC32-NEXT:    and 3, 3, 6
; PPC32-NEXT:    lis 7, -13108
; PPC32-NEXT:    lis 8, 13107
; PPC32-NEXT:    or 4, 4, 10
; PPC32-NEXT:    or 3, 3, 5
; PPC32-NEXT:    ori 7, 7, 52428
; PPC32-NEXT:    ori 8, 8, 13107
; PPC32-NEXT:    slwi 5, 4, 2
; PPC32-NEXT:    srwi 4, 4, 2
; PPC32-NEXT:    slwi 6, 3, 2
; PPC32-NEXT:    srwi 3, 3, 2
; PPC32-NEXT:    and 5, 5, 7
; PPC32-NEXT:    and 4, 4, 8
; PPC32-NEXT:    and 6, 6, 7
; PPC32-NEXT:    and 3, 3, 8
; PPC32-NEXT:    lis 9, -3856
; PPC32-NEXT:    lis 11, 3855
; PPC32-NEXT:    or 4, 4, 5
; PPC32-NEXT:    or 3, 3, 6
; PPC32-NEXT:    ori 9, 9, 61680
; PPC32-NEXT:    ori 11, 11, 3855
; PPC32-NEXT:    slwi 5, 4, 4
; PPC32-NEXT:    srwi 4, 4, 4
; PPC32-NEXT:    slwi 6, 3, 4
; PPC32-NEXT:    srwi 3, 3, 4
; PPC32-NEXT:    and 5, 5, 9
; PPC32-NEXT:    and 4, 4, 11
; PPC32-NEXT:    and 6, 6, 9
; PPC32-NEXT:    and 3, 3, 11
; PPC32-NEXT:    or 5, 4, 5
; PPC32-NEXT:    or 6, 3, 6
; PPC32-NEXT:    rotlwi 3, 5, 24
; PPC32-NEXT:    rotlwi 4, 6, 24
; PPC32-NEXT:    rlwimi 3, 5, 8, 8, 15
; PPC32-NEXT:    rlwimi 4, 6, 8, 8, 15
; PPC32-NEXT:    rlwimi 3, 5, 8, 24, 31
; PPC32-NEXT:    rlwimi 4, 6, 8, 24, 31
; PPC32-NEXT:    blr
;
; CHECK-LABEL: testBitReverseIntrinsicI64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lis 4, -21846
; CHECK-NEXT:    sldi 5, 3, 1
; CHECK-NEXT:    rldicl 3, 3, 63, 1
; CHECK-NEXT:    ori 4, 4, 43690
; CHECK-NEXT:    sldi 4, 4, 32
; CHECK-NEXT:    oris 4, 4, 43690
; CHECK-NEXT:    ori 4, 4, 43690
; CHECK-NEXT:    and 4, 5, 4
; CHECK-NEXT:    lis 5, 21845
; CHECK-NEXT:    ori 5, 5, 21845
; CHECK-NEXT:    sldi 5, 5, 32
; CHECK-NEXT:    oris 5, 5, 21845
; CHECK-NEXT:    ori 5, 5, 21845
; CHECK-NEXT:    and 3, 3, 5
; CHECK-NEXT:    lis 5, -13108
; CHECK-NEXT:    ori 5, 5, 52428
; CHECK-NEXT:    or 3, 3, 4
; CHECK-NEXT:    sldi 5, 5, 32
; CHECK-NEXT:    sldi 4, 3, 2
; CHECK-NEXT:    rldicl 3, 3, 62, 2
; CHECK-NEXT:    oris 5, 5, 52428
; CHECK-NEXT:    ori 5, 5, 52428
; CHECK-NEXT:    and 4, 4, 5
; CHECK-NEXT:    lis 5, 13107
; CHECK-NEXT:    ori 5, 5, 13107
; CHECK-NEXT:    sldi 5, 5, 32
; CHECK-NEXT:    oris 5, 5, 13107
; CHECK-NEXT:    ori 5, 5, 13107
; CHECK-NEXT:    and 3, 3, 5
; CHECK-NEXT:    lis 5, -3856
; CHECK-NEXT:    ori 5, 5, 61680
; CHECK-NEXT:    or 3, 3, 4
; CHECK-NEXT:    sldi 5, 5, 32
; CHECK-NEXT:    sldi 4, 3, 4
; CHECK-NEXT:    rldicl 3, 3, 60, 4
; CHECK-NEXT:    oris 5, 5, 61680
; CHECK-NEXT:    ori 5, 5, 61680
; CHECK-NEXT:    and 4, 4, 5
; CHECK-NEXT:    lis 5, 3855
; CHECK-NEXT:    ori 5, 5, 3855
; CHECK-NEXT:    sldi 5, 5, 32
; CHECK-NEXT:    oris 5, 5, 3855
; CHECK-NEXT:    ori 5, 5, 3855
; CHECK-NEXT:    and 3, 3, 5
; CHECK-NEXT:    or 3, 3, 4
; CHECK-NEXT:    rldicl 4, 3, 32, 32
; CHECK-NEXT:    rotlwi 5, 4, 24
; CHECK-NEXT:    rlwimi 5, 4, 8, 8, 15
; CHECK-NEXT:    rlwimi 5, 4, 8, 24, 31
; CHECK-NEXT:    rotlwi 4, 3, 24
; CHECK-NEXT:    rlwimi 4, 3, 8, 8, 15
; CHECK-NEXT:    rlwimi 4, 3, 8, 24, 31
; CHECK-NEXT:    sldi 3, 4, 32
; CHECK-NEXT:    or 3, 3, 5
; CHECK-NEXT:    blr
  %res = call i64 @llvm.bitreverse.i64(i64 %arg)
  ret i64 %res
}
