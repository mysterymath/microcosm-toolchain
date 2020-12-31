; RUN: llc -mtriple=riscv32 -mattr=+experimental-v,+d,+experimental-zfh -verify-machineinstrs \
; RUN:   --riscv-no-aliases < %s | FileCheck %s
declare <vscale x 1 x half> @llvm.riscv.vfwcvt.f.xu.v.nxv1f16.nxv1i8(
  <vscale x 1 x i8>,
  i32);

define <vscale x 1 x half> @intrinsic_vfwcvt_f.xu.v_nxv1f16_nxv1i8(<vscale x 1 x i8> %0, i32 %1) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwcvt_f.xu.v_nxv1f16_nxv1i8
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e8,mf8,ta,mu
; CHECK:       vfwcvt.f.xu.v {{v[0-9]+}}, {{v[0-9]+}}
  %a = call <vscale x 1 x half> @llvm.riscv.vfwcvt.f.xu.v.nxv1f16.nxv1i8(
    <vscale x 1 x i8> %0,
    i32 %1)

  ret <vscale x 1 x half> %a
}

declare <vscale x 1 x half> @llvm.riscv.vfwcvt.f.xu.v.mask.nxv1f16.nxv1i8(
  <vscale x 1 x half>,
  <vscale x 1 x i8>,
  <vscale x 1 x i1>,
  i32);

define <vscale x 1 x half> @intrinsic_vfwcvt_mask_f.xu.v_nxv1f16_nxv1i8(<vscale x 1 x half> %0, <vscale x 1 x i8> %1, <vscale x 1 x i1> %2, i32 %3) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwcvt_mask_f.xu.v_nxv1f16_nxv1i8
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e8,mf8,tu,mu
; CHECK:       vfwcvt.f.xu.v {{v[0-9]+}}, {{v[0-9]+}}, v0.t
  %a = call <vscale x 1 x half> @llvm.riscv.vfwcvt.f.xu.v.mask.nxv1f16.nxv1i8(
    <vscale x 1 x half> %0,
    <vscale x 1 x i8> %1,
    <vscale x 1 x i1> %2,
    i32 %3)

  ret <vscale x 1 x half> %a
}

declare <vscale x 2 x half> @llvm.riscv.vfwcvt.f.xu.v.nxv2f16.nxv2i8(
  <vscale x 2 x i8>,
  i32);

define <vscale x 2 x half> @intrinsic_vfwcvt_f.xu.v_nxv2f16_nxv2i8(<vscale x 2 x i8> %0, i32 %1) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwcvt_f.xu.v_nxv2f16_nxv2i8
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e8,mf4,ta,mu
; CHECK:       vfwcvt.f.xu.v {{v[0-9]+}}, {{v[0-9]+}}
  %a = call <vscale x 2 x half> @llvm.riscv.vfwcvt.f.xu.v.nxv2f16.nxv2i8(
    <vscale x 2 x i8> %0,
    i32 %1)

  ret <vscale x 2 x half> %a
}

declare <vscale x 2 x half> @llvm.riscv.vfwcvt.f.xu.v.mask.nxv2f16.nxv2i8(
  <vscale x 2 x half>,
  <vscale x 2 x i8>,
  <vscale x 2 x i1>,
  i32);

define <vscale x 2 x half> @intrinsic_vfwcvt_mask_f.xu.v_nxv2f16_nxv2i8(<vscale x 2 x half> %0, <vscale x 2 x i8> %1, <vscale x 2 x i1> %2, i32 %3) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwcvt_mask_f.xu.v_nxv2f16_nxv2i8
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e8,mf4,tu,mu
; CHECK:       vfwcvt.f.xu.v {{v[0-9]+}}, {{v[0-9]+}}, v0.t
  %a = call <vscale x 2 x half> @llvm.riscv.vfwcvt.f.xu.v.mask.nxv2f16.nxv2i8(
    <vscale x 2 x half> %0,
    <vscale x 2 x i8> %1,
    <vscale x 2 x i1> %2,
    i32 %3)

  ret <vscale x 2 x half> %a
}

declare <vscale x 4 x half> @llvm.riscv.vfwcvt.f.xu.v.nxv4f16.nxv4i8(
  <vscale x 4 x i8>,
  i32);

define <vscale x 4 x half> @intrinsic_vfwcvt_f.xu.v_nxv4f16_nxv4i8(<vscale x 4 x i8> %0, i32 %1) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwcvt_f.xu.v_nxv4f16_nxv4i8
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e8,mf2,ta,mu
; CHECK:       vfwcvt.f.xu.v {{v[0-9]+}}, {{v[0-9]+}}
  %a = call <vscale x 4 x half> @llvm.riscv.vfwcvt.f.xu.v.nxv4f16.nxv4i8(
    <vscale x 4 x i8> %0,
    i32 %1)

  ret <vscale x 4 x half> %a
}

declare <vscale x 4 x half> @llvm.riscv.vfwcvt.f.xu.v.mask.nxv4f16.nxv4i8(
  <vscale x 4 x half>,
  <vscale x 4 x i8>,
  <vscale x 4 x i1>,
  i32);

define <vscale x 4 x half> @intrinsic_vfwcvt_mask_f.xu.v_nxv4f16_nxv4i8(<vscale x 4 x half> %0, <vscale x 4 x i8> %1, <vscale x 4 x i1> %2, i32 %3) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwcvt_mask_f.xu.v_nxv4f16_nxv4i8
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e8,mf2,tu,mu
; CHECK:       vfwcvt.f.xu.v {{v[0-9]+}}, {{v[0-9]+}}, v0.t
  %a = call <vscale x 4 x half> @llvm.riscv.vfwcvt.f.xu.v.mask.nxv4f16.nxv4i8(
    <vscale x 4 x half> %0,
    <vscale x 4 x i8> %1,
    <vscale x 4 x i1> %2,
    i32 %3)

  ret <vscale x 4 x half> %a
}

declare <vscale x 8 x half> @llvm.riscv.vfwcvt.f.xu.v.nxv8f16.nxv8i8(
  <vscale x 8 x i8>,
  i32);

define <vscale x 8 x half> @intrinsic_vfwcvt_f.xu.v_nxv8f16_nxv8i8(<vscale x 8 x i8> %0, i32 %1) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwcvt_f.xu.v_nxv8f16_nxv8i8
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e8,m1,ta,mu
; CHECK:       vfwcvt.f.xu.v {{v[0-9]+}}, {{v[0-9]+}}
  %a = call <vscale x 8 x half> @llvm.riscv.vfwcvt.f.xu.v.nxv8f16.nxv8i8(
    <vscale x 8 x i8> %0,
    i32 %1)

  ret <vscale x 8 x half> %a
}

declare <vscale x 8 x half> @llvm.riscv.vfwcvt.f.xu.v.mask.nxv8f16.nxv8i8(
  <vscale x 8 x half>,
  <vscale x 8 x i8>,
  <vscale x 8 x i1>,
  i32);

define <vscale x 8 x half> @intrinsic_vfwcvt_mask_f.xu.v_nxv8f16_nxv8i8(<vscale x 8 x half> %0, <vscale x 8 x i8> %1, <vscale x 8 x i1> %2, i32 %3) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwcvt_mask_f.xu.v_nxv8f16_nxv8i8
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e8,m1,tu,mu
; CHECK:       vfwcvt.f.xu.v {{v[0-9]+}}, {{v[0-9]+}}, v0.t
  %a = call <vscale x 8 x half> @llvm.riscv.vfwcvt.f.xu.v.mask.nxv8f16.nxv8i8(
    <vscale x 8 x half> %0,
    <vscale x 8 x i8> %1,
    <vscale x 8 x i1> %2,
    i32 %3)

  ret <vscale x 8 x half> %a
}

declare <vscale x 16 x half> @llvm.riscv.vfwcvt.f.xu.v.nxv16f16.nxv16i8(
  <vscale x 16 x i8>,
  i32);

define <vscale x 16 x half> @intrinsic_vfwcvt_f.xu.v_nxv16f16_nxv16i8(<vscale x 16 x i8> %0, i32 %1) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwcvt_f.xu.v_nxv16f16_nxv16i8
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e8,m2,ta,mu
; CHECK:       vfwcvt.f.xu.v {{v[0-9]+}}, {{v[0-9]+}}
  %a = call <vscale x 16 x half> @llvm.riscv.vfwcvt.f.xu.v.nxv16f16.nxv16i8(
    <vscale x 16 x i8> %0,
    i32 %1)

  ret <vscale x 16 x half> %a
}

declare <vscale x 16 x half> @llvm.riscv.vfwcvt.f.xu.v.mask.nxv16f16.nxv16i8(
  <vscale x 16 x half>,
  <vscale x 16 x i8>,
  <vscale x 16 x i1>,
  i32);

define <vscale x 16 x half> @intrinsic_vfwcvt_mask_f.xu.v_nxv16f16_nxv16i8(<vscale x 16 x half> %0, <vscale x 16 x i8> %1, <vscale x 16 x i1> %2, i32 %3) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwcvt_mask_f.xu.v_nxv16f16_nxv16i8
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e8,m2,tu,mu
; CHECK:       vfwcvt.f.xu.v {{v[0-9]+}}, {{v[0-9]+}}, v0.t
  %a = call <vscale x 16 x half> @llvm.riscv.vfwcvt.f.xu.v.mask.nxv16f16.nxv16i8(
    <vscale x 16 x half> %0,
    <vscale x 16 x i8> %1,
    <vscale x 16 x i1> %2,
    i32 %3)

  ret <vscale x 16 x half> %a
}

declare <vscale x 32 x half> @llvm.riscv.vfwcvt.f.xu.v.nxv32f16.nxv32i8(
  <vscale x 32 x i8>,
  i32);

define <vscale x 32 x half> @intrinsic_vfwcvt_f.xu.v_nxv32f16_nxv32i8(<vscale x 32 x i8> %0, i32 %1) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwcvt_f.xu.v_nxv32f16_nxv32i8
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e8,m4,ta,mu
; CHECK:       vfwcvt.f.xu.v {{v[0-9]+}}, {{v[0-9]+}}
  %a = call <vscale x 32 x half> @llvm.riscv.vfwcvt.f.xu.v.nxv32f16.nxv32i8(
    <vscale x 32 x i8> %0,
    i32 %1)

  ret <vscale x 32 x half> %a
}

declare <vscale x 32 x half> @llvm.riscv.vfwcvt.f.xu.v.mask.nxv32f16.nxv32i8(
  <vscale x 32 x half>,
  <vscale x 32 x i8>,
  <vscale x 32 x i1>,
  i32);

define <vscale x 32 x half> @intrinsic_vfwcvt_mask_f.xu.v_nxv32f16_nxv32i8(<vscale x 32 x half> %0, <vscale x 32 x i8> %1, <vscale x 32 x i1> %2, i32 %3) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwcvt_mask_f.xu.v_nxv32f16_nxv32i8
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e8,m4,tu,mu
; CHECK:       vfwcvt.f.xu.v {{v[0-9]+}}, {{v[0-9]+}}, v0.t
  %a = call <vscale x 32 x half> @llvm.riscv.vfwcvt.f.xu.v.mask.nxv32f16.nxv32i8(
    <vscale x 32 x half> %0,
    <vscale x 32 x i8> %1,
    <vscale x 32 x i1> %2,
    i32 %3)

  ret <vscale x 32 x half> %a
}

declare <vscale x 1 x float> @llvm.riscv.vfwcvt.f.xu.v.nxv1f32.nxv1i16(
  <vscale x 1 x i16>,
  i32);

define <vscale x 1 x float> @intrinsic_vfwcvt_f.xu.v_nxv1f32_nxv1i16(<vscale x 1 x i16> %0, i32 %1) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwcvt_f.xu.v_nxv1f32_nxv1i16
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e16,mf4,ta,mu
; CHECK:       vfwcvt.f.xu.v {{v[0-9]+}}, {{v[0-9]+}}
  %a = call <vscale x 1 x float> @llvm.riscv.vfwcvt.f.xu.v.nxv1f32.nxv1i16(
    <vscale x 1 x i16> %0,
    i32 %1)

  ret <vscale x 1 x float> %a
}

declare <vscale x 1 x float> @llvm.riscv.vfwcvt.f.xu.v.mask.nxv1f32.nxv1i16(
  <vscale x 1 x float>,
  <vscale x 1 x i16>,
  <vscale x 1 x i1>,
  i32);

define <vscale x 1 x float> @intrinsic_vfwcvt_mask_f.xu.v_nxv1f32_nxv1i16(<vscale x 1 x float> %0, <vscale x 1 x i16> %1, <vscale x 1 x i1> %2, i32 %3) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwcvt_mask_f.xu.v_nxv1f32_nxv1i16
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e16,mf4,tu,mu
; CHECK:       vfwcvt.f.xu.v {{v[0-9]+}}, {{v[0-9]+}}, v0.t
  %a = call <vscale x 1 x float> @llvm.riscv.vfwcvt.f.xu.v.mask.nxv1f32.nxv1i16(
    <vscale x 1 x float> %0,
    <vscale x 1 x i16> %1,
    <vscale x 1 x i1> %2,
    i32 %3)

  ret <vscale x 1 x float> %a
}

declare <vscale x 2 x float> @llvm.riscv.vfwcvt.f.xu.v.nxv2f32.nxv2i16(
  <vscale x 2 x i16>,
  i32);

define <vscale x 2 x float> @intrinsic_vfwcvt_f.xu.v_nxv2f32_nxv2i16(<vscale x 2 x i16> %0, i32 %1) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwcvt_f.xu.v_nxv2f32_nxv2i16
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e16,mf2,ta,mu
; CHECK:       vfwcvt.f.xu.v {{v[0-9]+}}, {{v[0-9]+}}
  %a = call <vscale x 2 x float> @llvm.riscv.vfwcvt.f.xu.v.nxv2f32.nxv2i16(
    <vscale x 2 x i16> %0,
    i32 %1)

  ret <vscale x 2 x float> %a
}

declare <vscale x 2 x float> @llvm.riscv.vfwcvt.f.xu.v.mask.nxv2f32.nxv2i16(
  <vscale x 2 x float>,
  <vscale x 2 x i16>,
  <vscale x 2 x i1>,
  i32);

define <vscale x 2 x float> @intrinsic_vfwcvt_mask_f.xu.v_nxv2f32_nxv2i16(<vscale x 2 x float> %0, <vscale x 2 x i16> %1, <vscale x 2 x i1> %2, i32 %3) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwcvt_mask_f.xu.v_nxv2f32_nxv2i16
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e16,mf2,tu,mu
; CHECK:       vfwcvt.f.xu.v {{v[0-9]+}}, {{v[0-9]+}}, v0.t
  %a = call <vscale x 2 x float> @llvm.riscv.vfwcvt.f.xu.v.mask.nxv2f32.nxv2i16(
    <vscale x 2 x float> %0,
    <vscale x 2 x i16> %1,
    <vscale x 2 x i1> %2,
    i32 %3)

  ret <vscale x 2 x float> %a
}

declare <vscale x 4 x float> @llvm.riscv.vfwcvt.f.xu.v.nxv4f32.nxv4i16(
  <vscale x 4 x i16>,
  i32);

define <vscale x 4 x float> @intrinsic_vfwcvt_f.xu.v_nxv4f32_nxv4i16(<vscale x 4 x i16> %0, i32 %1) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwcvt_f.xu.v_nxv4f32_nxv4i16
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e16,m1,ta,mu
; CHECK:       vfwcvt.f.xu.v {{v[0-9]+}}, {{v[0-9]+}}
  %a = call <vscale x 4 x float> @llvm.riscv.vfwcvt.f.xu.v.nxv4f32.nxv4i16(
    <vscale x 4 x i16> %0,
    i32 %1)

  ret <vscale x 4 x float> %a
}

declare <vscale x 4 x float> @llvm.riscv.vfwcvt.f.xu.v.mask.nxv4f32.nxv4i16(
  <vscale x 4 x float>,
  <vscale x 4 x i16>,
  <vscale x 4 x i1>,
  i32);

define <vscale x 4 x float> @intrinsic_vfwcvt_mask_f.xu.v_nxv4f32_nxv4i16(<vscale x 4 x float> %0, <vscale x 4 x i16> %1, <vscale x 4 x i1> %2, i32 %3) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwcvt_mask_f.xu.v_nxv4f32_nxv4i16
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e16,m1,tu,mu
; CHECK:       vfwcvt.f.xu.v {{v[0-9]+}}, {{v[0-9]+}}, v0.t
  %a = call <vscale x 4 x float> @llvm.riscv.vfwcvt.f.xu.v.mask.nxv4f32.nxv4i16(
    <vscale x 4 x float> %0,
    <vscale x 4 x i16> %1,
    <vscale x 4 x i1> %2,
    i32 %3)

  ret <vscale x 4 x float> %a
}

declare <vscale x 8 x float> @llvm.riscv.vfwcvt.f.xu.v.nxv8f32.nxv8i16(
  <vscale x 8 x i16>,
  i32);

define <vscale x 8 x float> @intrinsic_vfwcvt_f.xu.v_nxv8f32_nxv8i16(<vscale x 8 x i16> %0, i32 %1) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwcvt_f.xu.v_nxv8f32_nxv8i16
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e16,m2,ta,mu
; CHECK:       vfwcvt.f.xu.v {{v[0-9]+}}, {{v[0-9]+}}
  %a = call <vscale x 8 x float> @llvm.riscv.vfwcvt.f.xu.v.nxv8f32.nxv8i16(
    <vscale x 8 x i16> %0,
    i32 %1)

  ret <vscale x 8 x float> %a
}

declare <vscale x 8 x float> @llvm.riscv.vfwcvt.f.xu.v.mask.nxv8f32.nxv8i16(
  <vscale x 8 x float>,
  <vscale x 8 x i16>,
  <vscale x 8 x i1>,
  i32);

define <vscale x 8 x float> @intrinsic_vfwcvt_mask_f.xu.v_nxv8f32_nxv8i16(<vscale x 8 x float> %0, <vscale x 8 x i16> %1, <vscale x 8 x i1> %2, i32 %3) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwcvt_mask_f.xu.v_nxv8f32_nxv8i16
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e16,m2,tu,mu
; CHECK:       vfwcvt.f.xu.v {{v[0-9]+}}, {{v[0-9]+}}, v0.t
  %a = call <vscale x 8 x float> @llvm.riscv.vfwcvt.f.xu.v.mask.nxv8f32.nxv8i16(
    <vscale x 8 x float> %0,
    <vscale x 8 x i16> %1,
    <vscale x 8 x i1> %2,
    i32 %3)

  ret <vscale x 8 x float> %a
}

declare <vscale x 16 x float> @llvm.riscv.vfwcvt.f.xu.v.nxv16f32.nxv16i16(
  <vscale x 16 x i16>,
  i32);

define <vscale x 16 x float> @intrinsic_vfwcvt_f.xu.v_nxv16f32_nxv16i16(<vscale x 16 x i16> %0, i32 %1) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwcvt_f.xu.v_nxv16f32_nxv16i16
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e16,m4,ta,mu
; CHECK:       vfwcvt.f.xu.v {{v[0-9]+}}, {{v[0-9]+}}
  %a = call <vscale x 16 x float> @llvm.riscv.vfwcvt.f.xu.v.nxv16f32.nxv16i16(
    <vscale x 16 x i16> %0,
    i32 %1)

  ret <vscale x 16 x float> %a
}

declare <vscale x 16 x float> @llvm.riscv.vfwcvt.f.xu.v.mask.nxv16f32.nxv16i16(
  <vscale x 16 x float>,
  <vscale x 16 x i16>,
  <vscale x 16 x i1>,
  i32);

define <vscale x 16 x float> @intrinsic_vfwcvt_mask_f.xu.v_nxv16f32_nxv16i16(<vscale x 16 x float> %0, <vscale x 16 x i16> %1, <vscale x 16 x i1> %2, i32 %3) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwcvt_mask_f.xu.v_nxv16f32_nxv16i16
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e16,m4,tu,mu
; CHECK:       vfwcvt.f.xu.v {{v[0-9]+}}, {{v[0-9]+}}, v0.t
  %a = call <vscale x 16 x float> @llvm.riscv.vfwcvt.f.xu.v.mask.nxv16f32.nxv16i16(
    <vscale x 16 x float> %0,
    <vscale x 16 x i16> %1,
    <vscale x 16 x i1> %2,
    i32 %3)

  ret <vscale x 16 x float> %a
}

declare <vscale x 1 x double> @llvm.riscv.vfwcvt.f.xu.v.nxv1f64.nxv1i32(
  <vscale x 1 x i32>,
  i32);

define <vscale x 1 x double> @intrinsic_vfwcvt_f.xu.v_nxv1f64_nxv1i32(<vscale x 1 x i32> %0, i32 %1) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwcvt_f.xu.v_nxv1f64_nxv1i32
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e32,mf2,ta,mu
; CHECK:       vfwcvt.f.xu.v {{v[0-9]+}}, {{v[0-9]+}}
  %a = call <vscale x 1 x double> @llvm.riscv.vfwcvt.f.xu.v.nxv1f64.nxv1i32(
    <vscale x 1 x i32> %0,
    i32 %1)

  ret <vscale x 1 x double> %a
}

declare <vscale x 1 x double> @llvm.riscv.vfwcvt.f.xu.v.mask.nxv1f64.nxv1i32(
  <vscale x 1 x double>,
  <vscale x 1 x i32>,
  <vscale x 1 x i1>,
  i32);

define <vscale x 1 x double> @intrinsic_vfwcvt_mask_f.xu.v_nxv1f64_nxv1i32(<vscale x 1 x double> %0, <vscale x 1 x i32> %1, <vscale x 1 x i1> %2, i32 %3) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwcvt_mask_f.xu.v_nxv1f64_nxv1i32
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e32,mf2,tu,mu
; CHECK:       vfwcvt.f.xu.v {{v[0-9]+}}, {{v[0-9]+}}, v0.t
  %a = call <vscale x 1 x double> @llvm.riscv.vfwcvt.f.xu.v.mask.nxv1f64.nxv1i32(
    <vscale x 1 x double> %0,
    <vscale x 1 x i32> %1,
    <vscale x 1 x i1> %2,
    i32 %3)

  ret <vscale x 1 x double> %a
}

declare <vscale x 2 x double> @llvm.riscv.vfwcvt.f.xu.v.nxv2f64.nxv2i32(
  <vscale x 2 x i32>,
  i32);

define <vscale x 2 x double> @intrinsic_vfwcvt_f.xu.v_nxv2f64_nxv2i32(<vscale x 2 x i32> %0, i32 %1) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwcvt_f.xu.v_nxv2f64_nxv2i32
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e32,m1,ta,mu
; CHECK:       vfwcvt.f.xu.v {{v[0-9]+}}, {{v[0-9]+}}
  %a = call <vscale x 2 x double> @llvm.riscv.vfwcvt.f.xu.v.nxv2f64.nxv2i32(
    <vscale x 2 x i32> %0,
    i32 %1)

  ret <vscale x 2 x double> %a
}

declare <vscale x 2 x double> @llvm.riscv.vfwcvt.f.xu.v.mask.nxv2f64.nxv2i32(
  <vscale x 2 x double>,
  <vscale x 2 x i32>,
  <vscale x 2 x i1>,
  i32);

define <vscale x 2 x double> @intrinsic_vfwcvt_mask_f.xu.v_nxv2f64_nxv2i32(<vscale x 2 x double> %0, <vscale x 2 x i32> %1, <vscale x 2 x i1> %2, i32 %3) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwcvt_mask_f.xu.v_nxv2f64_nxv2i32
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e32,m1,tu,mu
; CHECK:       vfwcvt.f.xu.v {{v[0-9]+}}, {{v[0-9]+}}, v0.t
  %a = call <vscale x 2 x double> @llvm.riscv.vfwcvt.f.xu.v.mask.nxv2f64.nxv2i32(
    <vscale x 2 x double> %0,
    <vscale x 2 x i32> %1,
    <vscale x 2 x i1> %2,
    i32 %3)

  ret <vscale x 2 x double> %a
}

declare <vscale x 4 x double> @llvm.riscv.vfwcvt.f.xu.v.nxv4f64.nxv4i32(
  <vscale x 4 x i32>,
  i32);

define <vscale x 4 x double> @intrinsic_vfwcvt_f.xu.v_nxv4f64_nxv4i32(<vscale x 4 x i32> %0, i32 %1) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwcvt_f.xu.v_nxv4f64_nxv4i32
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e32,m2,ta,mu
; CHECK:       vfwcvt.f.xu.v {{v[0-9]+}}, {{v[0-9]+}}
  %a = call <vscale x 4 x double> @llvm.riscv.vfwcvt.f.xu.v.nxv4f64.nxv4i32(
    <vscale x 4 x i32> %0,
    i32 %1)

  ret <vscale x 4 x double> %a
}

declare <vscale x 4 x double> @llvm.riscv.vfwcvt.f.xu.v.mask.nxv4f64.nxv4i32(
  <vscale x 4 x double>,
  <vscale x 4 x i32>,
  <vscale x 4 x i1>,
  i32);

define <vscale x 4 x double> @intrinsic_vfwcvt_mask_f.xu.v_nxv4f64_nxv4i32(<vscale x 4 x double> %0, <vscale x 4 x i32> %1, <vscale x 4 x i1> %2, i32 %3) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwcvt_mask_f.xu.v_nxv4f64_nxv4i32
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e32,m2,tu,mu
; CHECK:       vfwcvt.f.xu.v {{v[0-9]+}}, {{v[0-9]+}}, v0.t
  %a = call <vscale x 4 x double> @llvm.riscv.vfwcvt.f.xu.v.mask.nxv4f64.nxv4i32(
    <vscale x 4 x double> %0,
    <vscale x 4 x i32> %1,
    <vscale x 4 x i1> %2,
    i32 %3)

  ret <vscale x 4 x double> %a
}

declare <vscale x 8 x double> @llvm.riscv.vfwcvt.f.xu.v.nxv8f64.nxv8i32(
  <vscale x 8 x i32>,
  i32);

define <vscale x 8 x double> @intrinsic_vfwcvt_f.xu.v_nxv8f64_nxv8i32(<vscale x 8 x i32> %0, i32 %1) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwcvt_f.xu.v_nxv8f64_nxv8i32
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e32,m4,ta,mu
; CHECK:       vfwcvt.f.xu.v {{v[0-9]+}}, {{v[0-9]+}}
  %a = call <vscale x 8 x double> @llvm.riscv.vfwcvt.f.xu.v.nxv8f64.nxv8i32(
    <vscale x 8 x i32> %0,
    i32 %1)

  ret <vscale x 8 x double> %a
}

declare <vscale x 8 x double> @llvm.riscv.vfwcvt.f.xu.v.mask.nxv8f64.nxv8i32(
  <vscale x 8 x double>,
  <vscale x 8 x i32>,
  <vscale x 8 x i1>,
  i32);

define <vscale x 8 x double> @intrinsic_vfwcvt_mask_f.xu.v_nxv8f64_nxv8i32(<vscale x 8 x double> %0, <vscale x 8 x i32> %1, <vscale x 8 x i1> %2, i32 %3) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwcvt_mask_f.xu.v_nxv8f64_nxv8i32
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e32,m4,tu,mu
; CHECK:       vfwcvt.f.xu.v {{v[0-9]+}}, {{v[0-9]+}}, v0.t
  %a = call <vscale x 8 x double> @llvm.riscv.vfwcvt.f.xu.v.mask.nxv8f64.nxv8i32(
    <vscale x 8 x double> %0,
    <vscale x 8 x i32> %1,
    <vscale x 8 x i1> %2,
    i32 %3)

  ret <vscale x 8 x double> %a
}
