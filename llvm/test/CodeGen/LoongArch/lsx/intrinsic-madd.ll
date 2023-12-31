; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc --mtriple=loongarch64 --mattr=+lsx < %s | FileCheck %s

declare <16 x i8> @llvm.loongarch.lsx.vmadd.b(<16 x i8>, <16 x i8>, <16 x i8>)

define <16 x i8> @lsx_vmadd_b(<16 x i8> %va, <16 x i8> %vb, <16 x i8> %vc) nounwind {
; CHECK-LABEL: lsx_vmadd_b:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vmadd.b $vr0, $vr1, $vr2
; CHECK-NEXT:    ret
entry:
  %res = call <16 x i8> @llvm.loongarch.lsx.vmadd.b(<16 x i8> %va, <16 x i8> %vb, <16 x i8> %vc)
  ret <16 x i8> %res
}

declare <8 x i16> @llvm.loongarch.lsx.vmadd.h(<8 x i16>, <8 x i16>, <8 x i16>)

define <8 x i16> @lsx_vmadd_h(<8 x i16> %va, <8 x i16> %vb, <8 x i16> %vc) nounwind {
; CHECK-LABEL: lsx_vmadd_h:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vmadd.h $vr0, $vr1, $vr2
; CHECK-NEXT:    ret
entry:
  %res = call <8 x i16> @llvm.loongarch.lsx.vmadd.h(<8 x i16> %va, <8 x i16> %vb, <8 x i16> %vc)
  ret <8 x i16> %res
}

declare <4 x i32> @llvm.loongarch.lsx.vmadd.w(<4 x i32>, <4 x i32>, <4 x i32>)

define <4 x i32> @lsx_vmadd_w(<4 x i32> %va, <4 x i32> %vb, <4 x i32> %vc) nounwind {
; CHECK-LABEL: lsx_vmadd_w:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vmadd.w $vr0, $vr1, $vr2
; CHECK-NEXT:    ret
entry:
  %res = call <4 x i32> @llvm.loongarch.lsx.vmadd.w(<4 x i32> %va, <4 x i32> %vb, <4 x i32> %vc)
  ret <4 x i32> %res
}

declare <2 x i64> @llvm.loongarch.lsx.vmadd.d(<2 x i64>, <2 x i64>, <2 x i64>)

define <2 x i64> @lsx_vmadd_d(<2 x i64> %va, <2 x i64> %vb, <2 x i64> %vc) nounwind {
; CHECK-LABEL: lsx_vmadd_d:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vmadd.d $vr0, $vr1, $vr2
; CHECK-NEXT:    ret
entry:
  %res = call <2 x i64> @llvm.loongarch.lsx.vmadd.d(<2 x i64> %va, <2 x i64> %vb, <2 x i64> %vc)
  ret <2 x i64> %res
}
