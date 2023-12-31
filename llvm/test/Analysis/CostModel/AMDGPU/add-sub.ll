; NOTE: Assertions have been autogenerated by utils/update_analyze_test_checks.py
; RUN: opt -passes="print<cost-model>" 2>&1 -disable-output -mtriple=amdgcn-unknown-amdhsa -mcpu=gfx900 -mattr=+half-rate-64-ops < %s | FileCheck -check-prefixes=ALL,FAST16 %s
; RUN: opt -passes="print<cost-model>" 2>&1 -disable-output -mtriple=amdgcn-unknown-amdhsa -mattr=-half-rate-64-ops < %s | FileCheck -check-prefixes=ALL,SLOW16 %s
; RUN: opt -passes="print<cost-model>" -cost-kind=code-size 2>&1 -disable-output -mtriple=amdgcn-unknown-amdhsa -mcpu=gfx900 -mattr=+half-rate-64-ops < %s | FileCheck -check-prefixes=ALL-SIZE,FAST16-SIZE %s
; RUN: opt -passes="print<cost-model>" -cost-kind=code-size 2>&1 -disable-output -mtriple=amdgcn-unknown-amdhsa -mattr=-half-rate-64-ops < %s | FileCheck -check-prefixes=ALL-SIZE,SLOW16-SIZE %s
; END.

define amdgpu_kernel void @add_i32() #0 {
; ALL-LABEL: 'add_i32'
; ALL-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i32 = add i32 undef, undef
; ALL-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v2i32 = add <2 x i32> undef, undef
; ALL-NEXT:  Cost Model: Found an estimated cost of 3 for instruction: %v3i32 = add <3 x i32> undef, undef
; ALL-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v4i32 = add <4 x i32> undef, undef
; ALL-NEXT:  Cost Model: Found an estimated cost of 5 for instruction: %v5i32 = add <5 x i32> undef, undef
; ALL-NEXT:  Cost Model: Found an estimated cost of 6 for instruction: %v6i32 = add <6 x i32> undef, undef
; ALL-NEXT:  Cost Model: Found an estimated cost of 7 for instruction: %v7i32 = add <7 x i32> undef, undef
; ALL-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %v8i32 = add <8 x i32> undef, undef
; ALL-NEXT:  Cost Model: Found an estimated cost of 27 for instruction: %v9i32 = add <9 x i32> undef, undef
; ALL-NEXT:  Cost Model: Found an estimated cost of 10 for instruction: ret void
;
; ALL-SIZE-LABEL: 'add_i32'
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i32 = add i32 undef, undef
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v2i32 = add <2 x i32> undef, undef
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 3 for instruction: %v3i32 = add <3 x i32> undef, undef
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v4i32 = add <4 x i32> undef, undef
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 5 for instruction: %v5i32 = add <5 x i32> undef, undef
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 6 for instruction: %v6i32 = add <6 x i32> undef, undef
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 7 for instruction: %v7i32 = add <7 x i32> undef, undef
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %v8i32 = add <8 x i32> undef, undef
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 27 for instruction: %v9i32 = add <9 x i32> undef, undef
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: ret void
;
  %i32 = add i32 undef, undef
  %v2i32 = add <2 x i32> undef, undef
  %v3i32 = add <3 x i32> undef, undef
  %v4i32 = add <4 x i32> undef, undef
  %v5i32 = add <5 x i32> undef, undef
  %v6i32 = add <6 x i32> undef, undef
  %v7i32 = add <7 x i32> undef, undef
  %v8i32 = add <8 x i32> undef, undef
  %v9i32 = add <9 x i32> undef, undef
  ret void
}

define amdgpu_kernel void @add_i64() #0 {
; ALL-LABEL: 'add_i64'
; ALL-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %i64 = add i64 undef, undef
; ALL-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v2i64 = add <2 x i64> undef, undef
; ALL-NEXT:  Cost Model: Found an estimated cost of 6 for instruction: %v3i64 = add <3 x i64> undef, undef
; ALL-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %v4i64 = add <4 x i64> undef, undef
; ALL-NEXT:  Cost Model: Found an estimated cost of 48 for instruction: %v5i64 = add <5 x i64> undef, undef
; ALL-NEXT:  Cost Model: Found an estimated cost of 10 for instruction: ret void
;
; ALL-SIZE-LABEL: 'add_i64'
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %i64 = add i64 undef, undef
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v2i64 = add <2 x i64> undef, undef
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 6 for instruction: %v3i64 = add <3 x i64> undef, undef
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %v4i64 = add <4 x i64> undef, undef
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 48 for instruction: %v5i64 = add <5 x i64> undef, undef
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: ret void
;
  %i64 = add i64 undef, undef
  %v2i64 = add <2 x i64> undef, undef
  %v3i64 = add <3 x i64> undef, undef
  %v4i64 = add <4 x i64> undef, undef
  %v5i64 = add <5 x i64> undef, undef
  ret void
}

define amdgpu_kernel void @add_i16() #0 {
; FAST16-LABEL: 'add_i16'
; FAST16-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i16 = add i16 undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %v2i16 = add <2 x i16> undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v3i16 = add <3 x i16> undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v4i16 = add <4 x i16> undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v5i16 = add <5 x i16> undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v6i16 = add <6 x i16> undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %v16i16 = add <16 x i16> undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 48 for instruction: %v17i16 = add <17 x i16> undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 10 for instruction: ret void
;
; SLOW16-LABEL: 'add_i16'
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i16 = add i16 undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v2i16 = add <2 x i16> undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v3i16 = add <3 x i16> undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v4i16 = add <4 x i16> undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %v5i16 = add <5 x i16> undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %v6i16 = add <6 x i16> undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %v16i16 = add <16 x i16> undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 34 for instruction: %v17i16 = add <17 x i16> undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 10 for instruction: ret void
;
; FAST16-SIZE-LABEL: 'add_i16'
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i16 = add i16 undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %v2i16 = add <2 x i16> undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v3i16 = add <3 x i16> undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v4i16 = add <4 x i16> undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v5i16 = add <5 x i16> undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v6i16 = add <6 x i16> undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %v16i16 = add <16 x i16> undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 48 for instruction: %v17i16 = add <17 x i16> undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: ret void
;
; SLOW16-SIZE-LABEL: 'add_i16'
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i16 = add i16 undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v2i16 = add <2 x i16> undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v3i16 = add <3 x i16> undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v4i16 = add <4 x i16> undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %v5i16 = add <5 x i16> undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %v6i16 = add <6 x i16> undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %v16i16 = add <16 x i16> undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 34 for instruction: %v17i16 = add <17 x i16> undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: ret void
;
  %i16 = add i16 undef, undef
  %v2i16 = add <2 x i16> undef, undef
  %v3i16 = add <3 x i16> undef, undef
  %v4i16 = add <4 x i16> undef, undef
  %v5i16 = add <5 x i16> undef, undef
  %v6i16 = add <6 x i16> undef, undef
  %v16i16 = add <16 x i16> undef, undef
  %v17i16 = add <17 x i16> undef, undef
  ret void
}

define amdgpu_kernel void @add_i8() #0 {
; ALL-LABEL: 'add_i8'
; ALL-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i8 = add i8 undef, undef
; ALL-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v2i8 = add <2 x i8> undef, undef
; ALL-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v3i8 = add <3 x i8> undef, undef
; ALL-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v4i8 = add <4 x i8> undef, undef
; ALL-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %v5i8 = add <5 x i8> undef, undef
; ALL-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %v6i8 = add <6 x i8> undef, undef
; ALL-NEXT:  Cost Model: Found an estimated cost of 32 for instruction: %v32i8 = add <32 x i8> undef, undef
; ALL-NEXT:  Cost Model: Found an estimated cost of 66 for instruction: %v33i8 = add <33 x i8> undef, undef
; ALL-NEXT:  Cost Model: Found an estimated cost of 10 for instruction: ret void
;
; ALL-SIZE-LABEL: 'add_i8'
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i8 = add i8 undef, undef
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v2i8 = add <2 x i8> undef, undef
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v3i8 = add <3 x i8> undef, undef
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v4i8 = add <4 x i8> undef, undef
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %v5i8 = add <5 x i8> undef, undef
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %v6i8 = add <6 x i8> undef, undef
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 32 for instruction: %v32i8 = add <32 x i8> undef, undef
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 66 for instruction: %v33i8 = add <33 x i8> undef, undef
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: ret void
;
  %i8 = add i8 undef, undef
  %v2i8 = add <2 x i8> undef, undef
  %v3i8 = add <3 x i8> undef, undef
  %v4i8 = add <4 x i8> undef, undef
  %v5i8 = add <5 x i8> undef, undef
  %v6i8 = add <6 x i8> undef, undef
  %v32i8 = add <32 x i8> undef, undef
  %v33i8 = add <33 x i8> undef, undef
  ret void
}

define amdgpu_kernel void @sub() #0 {
; FAST16-LABEL: 'sub'
; FAST16-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i8 = sub i8 undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i16 = sub i16 undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i32 = sub i32 undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %i64 = sub i64 undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %v2i16 = sub <2 x i16> undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v3i16 = sub <3 x i16> undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v4i16 = sub <4 x i16> undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 10 for instruction: ret void
;
; SLOW16-LABEL: 'sub'
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i8 = sub i8 undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i16 = sub i16 undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i32 = sub i32 undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %i64 = sub i64 undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v2i16 = sub <2 x i16> undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v3i16 = sub <3 x i16> undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v4i16 = sub <4 x i16> undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 10 for instruction: ret void
;
; FAST16-SIZE-LABEL: 'sub'
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i8 = sub i8 undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i16 = sub i16 undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i32 = sub i32 undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %i64 = sub i64 undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %v2i16 = sub <2 x i16> undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v3i16 = sub <3 x i16> undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v4i16 = sub <4 x i16> undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: ret void
;
; SLOW16-SIZE-LABEL: 'sub'
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i8 = sub i8 undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i16 = sub i16 undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i32 = sub i32 undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %i64 = sub i64 undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v2i16 = sub <2 x i16> undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v3i16 = sub <3 x i16> undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v4i16 = sub <4 x i16> undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: ret void
;
  %i8 = sub i8 undef, undef
  %i16 = sub i16 undef, undef
  %i32 = sub i32 undef, undef
  %i64 = sub i64 undef, undef
  %v2i16 = sub <2 x i16> undef, undef
  %v3i16 = sub <3 x i16> undef, undef
  %v4i16 = sub <4 x i16> undef, undef
  ret void
}

attributes #0 = { nounwind }
