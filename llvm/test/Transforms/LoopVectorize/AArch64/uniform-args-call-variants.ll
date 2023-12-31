; NOTE: Assertions have been autogenerated by utils/update_test_checks.py UTC_ARGS: --version 2
; RUN: opt < %s -passes=loop-vectorize,simplifycfg,instcombine -force-vector-interleave=1 -prefer-predicate-over-epilogue=predicate-dont-vectorize -S | FileCheck %s

target triple = "aarch64-unknown-linux-gnu"

; A call whose argument can remain a scalar for a vectorized function variant
; with a uniform argument because it's loop invariant
define void @test_uniform(ptr noalias %dst, ptr readonly %src, i64 %uniform , i64 %n) #0 {
; CHECK-LABEL: define void @test_uniform
; CHECK-SAME: (ptr noalias [[DST:%.*]], ptr readonly [[SRC:%.*]], i64 [[UNIFORM:%.*]], i64 [[N:%.*]]) #[[ATTR0:[0-9]+]] {
; CHECK-NEXT:  entry:
; CHECK-NEXT:    br label [[FOR_BODY:%.*]]
; CHECK:       for.body:
; CHECK-NEXT:    [[INDVARS_IV:%.*]] = phi i64 [ 0, [[ENTRY:%.*]] ], [ [[INDVARS_IV_NEXT:%.*]], [[FOR_BODY]] ]
; CHECK-NEXT:    [[GEPSRC:%.*]] = getelementptr double, ptr [[SRC]], i64 [[INDVARS_IV]]
; CHECK-NEXT:    [[DATA:%.*]] = load double, ptr [[GEPSRC]], align 8
; CHECK-NEXT:    [[CALL:%.*]] = call double @foo(double [[DATA]], i64 [[UNIFORM]]) #[[ATTR1:[0-9]+]]
; CHECK-NEXT:    [[GEPDST:%.*]] = getelementptr inbounds double, ptr [[DST]], i64 [[INDVARS_IV]]
; CHECK-NEXT:    store double [[CALL]], ptr [[GEPDST]], align 8
; CHECK-NEXT:    [[INDVARS_IV_NEXT]] = add nuw nsw i64 [[INDVARS_IV]], 1
; CHECK-NEXT:    [[EXITCOND:%.*]] = icmp eq i64 [[INDVARS_IV_NEXT]], [[N]]
; CHECK-NEXT:    br i1 [[EXITCOND]], label [[FOR_COND_CLEANUP:%.*]], label [[FOR_BODY]]
; CHECK:       for.cond.cleanup:
; CHECK-NEXT:    ret void
;
entry:
  br label %for.body

for.body:
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.body ]
  %gepsrc = getelementptr double, ptr %src, i64 %indvars.iv
  %data = load double, ptr %gepsrc, align 8
  %call = call double @foo(double %data, i64 %uniform) #1
  %gepdst = getelementptr inbounds double, ptr %dst, i64 %indvars.iv
  store double %call, ptr %gepdst
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %n
  br i1 %exitcond, label %for.cond.cleanup, label %for.body

for.cond.cleanup:
  ret void
}

; If the parameter is not uniform, then we can't use the vector variant.
define void @test_uniform_not_invariant(ptr noalias %dst, ptr readonly %src, i64 %n) #0 {
; CHECK-LABEL: define void @test_uniform_not_invariant
; CHECK-SAME: (ptr noalias [[DST:%.*]], ptr readonly [[SRC:%.*]], i64 [[N:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:  entry:
; CHECK-NEXT:    br label [[FOR_BODY:%.*]]
; CHECK:       for.body:
; CHECK-NEXT:    [[INDVARS_IV:%.*]] = phi i64 [ 0, [[ENTRY:%.*]] ], [ [[INDVARS_IV_NEXT:%.*]], [[FOR_BODY]] ]
; CHECK-NEXT:    [[GEPSRC:%.*]] = getelementptr double, ptr [[SRC]], i64 [[INDVARS_IV]]
; CHECK-NEXT:    [[DATA:%.*]] = load double, ptr [[GEPSRC]], align 8
; CHECK-NEXT:    [[CALL:%.*]] = call double @foo(double [[DATA]], i64 [[INDVARS_IV]]) #[[ATTR1]]
; CHECK-NEXT:    [[GEPDST:%.*]] = getelementptr inbounds double, ptr [[DST]], i64 [[INDVARS_IV]]
; CHECK-NEXT:    store double [[CALL]], ptr [[GEPDST]], align 8
; CHECK-NEXT:    [[INDVARS_IV_NEXT]] = add nuw nsw i64 [[INDVARS_IV]], 1
; CHECK-NEXT:    [[EXITCOND:%.*]] = icmp eq i64 [[INDVARS_IV_NEXT]], [[N]]
; CHECK-NEXT:    br i1 [[EXITCOND]], label [[FOR_COND_CLEANUP:%.*]], label [[FOR_BODY]]
; CHECK:       for.cond.cleanup:
; CHECK-NEXT:    ret void
;
entry:
  br label %for.body

for.body:
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.body ]
  %gepsrc = getelementptr double, ptr %src, i64 %indvars.iv
  %data = load double, ptr %gepsrc, align 8
  %call = call double @foo(double %data, i64 %indvars.iv) #1
  %gepdst = getelementptr inbounds double, ptr %dst, i64 %indvars.iv
  store double %call, ptr %gepdst
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %n
  br i1 %exitcond, label %for.cond.cleanup, label %for.body

for.cond.cleanup:
  ret void
}

; Scalar functions
declare double @foo(double, i64)

; Vector variants
declare <vscale x 2 x double> @foo_uniform(<vscale x 2 x double>, i64, <vscale x 2 x i1>)

attributes #0 = { "target-features"="+sve" }

; Mappings
attributes #1 = { nounwind "vector-function-abi-variant"="_ZGV_LLVM_Mxvu_foo(foo_uniform)" }
