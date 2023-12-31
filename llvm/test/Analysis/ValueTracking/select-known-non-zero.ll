; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -passes=instsimplify -S | FileCheck %s

declare void @llvm.assume(i1)

define i1 @select_v_ne_fail(i8 %v, i8 %C, i8 %y) {
; CHECK-LABEL: @select_v_ne_fail(
; CHECK-NEXT:    [[YNZ:%.*]] = icmp ne i8 [[Y:%.*]], 0
; CHECK-NEXT:    call void @llvm.assume(i1 [[YNZ]])
; CHECK-NEXT:    [[CMP:%.*]] = icmp ne i8 [[V:%.*]], [[C:%.*]]
; CHECK-NEXT:    [[S:%.*]] = select i1 [[CMP]], i8 [[V]], i8 [[Y]]
; CHECK-NEXT:    [[R:%.*]] = icmp eq i8 [[S]], 0
; CHECK-NEXT:    ret i1 [[R]]
;
  %ynz = icmp ne i8 %y, 0
  call void @llvm.assume(i1 %ynz)
  %cmp = icmp ne i8 %v, %C
  %s = select i1 %cmp, i8 %v, i8 %y
  %r = icmp eq i8 %s, 0
  ret i1 %r
}

define i1 @select_v_eq_nz(i8 %v, i8 %C, i8 %y) {
; CHECK-LABEL: @select_v_eq_nz(
; CHECK-NEXT:    [[YNZ:%.*]] = icmp ne i8 [[Y:%.*]], 0
; CHECK-NEXT:    call void @llvm.assume(i1 [[YNZ]])
; CHECK-NEXT:    [[PCOND0:%.*]] = icmp ne i8 [[C:%.*]], 0
; CHECK-NEXT:    call void @llvm.assume(i1 [[PCOND0]])
; CHECK-NEXT:    [[CMP:%.*]] = icmp eq i8 [[C]], [[V:%.*]]
; CHECK-NEXT:    [[S:%.*]] = select i1 [[CMP]], i8 [[V]], i8 [[Y]]
; CHECK-NEXT:    [[R:%.*]] = icmp eq i8 [[S]], 0
; CHECK-NEXT:    ret i1 [[R]]
;
  %ynz = icmp ne i8 %y, 0
  call void @llvm.assume(i1 %ynz)
  %pcond0 = icmp ne i8 %C, 0
  call void @llvm.assume(i1 %pcond0)
  %cmp = icmp eq i8 %C, %v
  %s = select i1 %cmp, i8 %v, i8 %y
  %r = icmp eq i8 %s, 0
  ret i1 %r
}

define i1 @inv_select_v_ugt_nz(i8 %v, i8 %C, i8 %y) {
; CHECK-LABEL: @inv_select_v_ugt_nz(
; CHECK-NEXT:    [[YNZ:%.*]] = icmp ne i8 [[Y:%.*]], 0
; CHECK-NEXT:    call void @llvm.assume(i1 [[YNZ]])
; CHECK-NEXT:    [[PCOND0:%.*]] = icmp ne i8 [[C:%.*]], 0
; CHECK-NEXT:    call void @llvm.assume(i1 [[PCOND0]])
; CHECK-NEXT:    [[CMP:%.*]] = icmp ugt i8 [[C]], [[V:%.*]]
; CHECK-NEXT:    [[S:%.*]] = select i1 [[CMP]], i8 [[Y]], i8 [[V]]
; CHECK-NEXT:    [[R:%.*]] = icmp eq i8 [[S]], 0
; CHECK-NEXT:    ret i1 [[R]]
;
  %ynz = icmp ne i8 %y, 0
  call void @llvm.assume(i1 %ynz)
  %pcond0 = icmp ne i8 %C, 0
  call void @llvm.assume(i1 %pcond0)
  %cmp = icmp ugt i8 %C, %v
  %s = select i1 %cmp, i8 %y, i8 %v
  %r = icmp eq i8 %s, 0
  ret i1 %r
}

define i1 @inv_select_v_ugt_fail(i8 %v, i8 %C, i8 %y) {
; CHECK-LABEL: @inv_select_v_ugt_fail(
; CHECK-NEXT:    [[YNZ:%.*]] = icmp ne i8 [[Y:%.*]], 0
; CHECK-NEXT:    call void @llvm.assume(i1 [[YNZ]])
; CHECK-NEXT:    [[PCOND0:%.*]] = icmp sge i8 [[C:%.*]], -8
; CHECK-NEXT:    call void @llvm.assume(i1 [[PCOND0]])
; CHECK-NEXT:    [[CMP:%.*]] = icmp ugt i8 [[C]], [[V:%.*]]
; CHECK-NEXT:    [[S:%.*]] = select i1 [[CMP]], i8 [[Y]], i8 [[V]]
; CHECK-NEXT:    [[R:%.*]] = icmp eq i8 [[S]], 0
; CHECK-NEXT:    ret i1 [[R]]
;
  %ynz = icmp ne i8 %y, 0
  call void @llvm.assume(i1 %ynz)
  %pcond0 = icmp sge i8 %C, -8
  call void @llvm.assume(i1 %pcond0)
  %cmp = icmp ugt i8 %C, %v
  %s = select i1 %cmp, i8 %y, i8 %v
  %r = icmp eq i8 %s, 0
  ret i1 %r
}

define i1 @select_v_uge_nz(i8 %v, i8 %C, i8 %y) {
; CHECK-LABEL: @select_v_uge_nz(
; CHECK-NEXT:    [[YNZ:%.*]] = icmp ne i8 [[Y:%.*]], 0
; CHECK-NEXT:    call void @llvm.assume(i1 [[YNZ]])
; CHECK-NEXT:    [[PCOND0:%.*]] = icmp ne i8 [[C:%.*]], 0
; CHECK-NEXT:    call void @llvm.assume(i1 [[PCOND0]])
; CHECK-NEXT:    [[CMP:%.*]] = icmp uge i8 [[V:%.*]], [[C]]
; CHECK-NEXT:    [[S:%.*]] = select i1 [[CMP]], i8 [[V]], i8 [[Y]]
; CHECK-NEXT:    [[R:%.*]] = icmp eq i8 [[S]], 0
; CHECK-NEXT:    ret i1 [[R]]
;
  %ynz = icmp ne i8 %y, 0
  call void @llvm.assume(i1 %ynz)
  %pcond0 = icmp ne i8 %C, 0
  call void @llvm.assume(i1 %pcond0)
  %cmp = icmp uge i8 %v, %C
  %s = select i1 %cmp, i8 %v, i8 %y
  %r = icmp eq i8 %s, 0
  ret i1 %r
}

define i1 @select_v_sgt_nonneg(i8 %v, i8 %C, i8 %y) {
; CHECK-LABEL: @select_v_sgt_nonneg(
; CHECK-NEXT:    [[YNZ:%.*]] = icmp ne i8 [[Y:%.*]], 0
; CHECK-NEXT:    call void @llvm.assume(i1 [[YNZ]])
; CHECK-NEXT:    [[PCOND0:%.*]] = icmp sge i8 [[C:%.*]], 0
; CHECK-NEXT:    call void @llvm.assume(i1 [[PCOND0]])
; CHECK-NEXT:    [[CMP:%.*]] = icmp sgt i8 [[V:%.*]], [[C]]
; CHECK-NEXT:    [[S:%.*]] = select i1 [[CMP]], i8 [[V]], i8 [[Y]]
; CHECK-NEXT:    [[R:%.*]] = icmp eq i8 [[S]], 0
; CHECK-NEXT:    ret i1 [[R]]
;
  %ynz = icmp ne i8 %y, 0
  call void @llvm.assume(i1 %ynz)
  %pcond0 = icmp sge i8 %C, 0
  call void @llvm.assume(i1 %pcond0)
  %cmp = icmp sgt i8 %v, %C
  %s = select i1 %cmp, i8 %v, i8 %y
  %r = icmp eq i8 %s, 0
  ret i1 %r
}

define i1 @select_v_sgt_fail(i8 %v, i8 %C, i8 %y) {
; CHECK-LABEL: @select_v_sgt_fail(
; CHECK-NEXT:    [[YNZ:%.*]] = icmp ne i8 [[Y:%.*]], 0
; CHECK-NEXT:    call void @llvm.assume(i1 [[YNZ]])
; CHECK-NEXT:    [[PCOND0:%.*]] = icmp sge i8 [[C:%.*]], -4
; CHECK-NEXT:    call void @llvm.assume(i1 [[PCOND0]])
; CHECK-NEXT:    [[CMP:%.*]] = icmp sgt i8 [[V:%.*]], [[C]]
; CHECK-NEXT:    [[S:%.*]] = select i1 [[CMP]], i8 [[V]], i8 [[Y]]
; CHECK-NEXT:    [[R:%.*]] = icmp eq i8 [[S]], 0
; CHECK-NEXT:    ret i1 [[R]]
;
  %ynz = icmp ne i8 %y, 0
  call void @llvm.assume(i1 %ynz)
  %pcond0 = icmp sge i8 %C, -4
  call void @llvm.assume(i1 %pcond0)
  %cmp = icmp sgt i8 %v, %C
  %s = select i1 %cmp, i8 %v, i8 %y
  %r = icmp eq i8 %s, 0
  ret i1 %r
}

define i1 @inv_select_v_sgt_neg(i8 %v, i8 %C, i8 %y) {
; CHECK-LABEL: @inv_select_v_sgt_neg(
; CHECK-NEXT:    [[YNZ:%.*]] = icmp ne i8 [[Y:%.*]], 0
; CHECK-NEXT:    call void @llvm.assume(i1 [[YNZ]])
; CHECK-NEXT:    [[PCOND0:%.*]] = icmp slt i8 [[C:%.*]], 0
; CHECK-NEXT:    call void @llvm.assume(i1 [[PCOND0]])
; CHECK-NEXT:    [[CMP:%.*]] = icmp sgt i8 [[V:%.*]], [[C]]
; CHECK-NEXT:    [[S:%.*]] = select i1 [[CMP]], i8 [[Y]], i8 [[V]]
; CHECK-NEXT:    [[R:%.*]] = icmp eq i8 [[S]], 0
; CHECK-NEXT:    ret i1 [[R]]
;
  %ynz = icmp ne i8 %y, 0
  call void @llvm.assume(i1 %ynz)
  %pcond0 = icmp slt i8 %C, 0
  call void @llvm.assume(i1 %pcond0)
  %cmp = icmp sgt i8 %v, %C
  %s = select i1 %cmp, i8 %y, i8 %v
  %r = icmp eq i8 %s, 0
  ret i1 %r
}

define i1 @inv_select_v_sgt_nonneg_nz(i8 %v, i8 %C, i8 %y) {
; CHECK-LABEL: @inv_select_v_sgt_nonneg_nz(
; CHECK-NEXT:    [[YNZ:%.*]] = icmp ne i8 [[Y:%.*]], 0
; CHECK-NEXT:    call void @llvm.assume(i1 [[YNZ]])
; CHECK-NEXT:    [[PCOND0:%.*]] = icmp sgt i8 [[C:%.*]], 0
; CHECK-NEXT:    call void @llvm.assume(i1 [[PCOND0]])
; CHECK-NEXT:    [[CMP:%.*]] = icmp sgt i8 [[C]], [[V:%.*]]
; CHECK-NEXT:    [[S:%.*]] = select i1 [[CMP]], i8 [[Y]], i8 [[V]]
; CHECK-NEXT:    [[R:%.*]] = icmp eq i8 [[S]], 0
; CHECK-NEXT:    ret i1 [[R]]
;
  %ynz = icmp ne i8 %y, 0
  call void @llvm.assume(i1 %ynz)
  %pcond0 = icmp sgt i8 %C, 0
  call void @llvm.assume(i1 %pcond0)
  %cmp = icmp sgt i8 %C, %v
  %s = select i1 %cmp, i8 %y, i8 %v
  %r = icmp eq i8 %s, 0
  ret i1 %r
}

define i1 @select_v_slt_nonneg(i8 %v, i8 %C, i8 %y) {
; CHECK-LABEL: @select_v_slt_nonneg(
; CHECK-NEXT:    [[YNZ:%.*]] = icmp ne i8 [[Y:%.*]], 0
; CHECK-NEXT:    call void @llvm.assume(i1 [[YNZ]])
; CHECK-NEXT:    [[PCOND0:%.*]] = icmp sge i8 [[C:%.*]], 0
; CHECK-NEXT:    call void @llvm.assume(i1 [[PCOND0]])
; CHECK-NEXT:    [[CMP:%.*]] = icmp slt i8 [[C]], [[V:%.*]]
; CHECK-NEXT:    [[S:%.*]] = select i1 [[CMP]], i8 [[V]], i8 [[Y]]
; CHECK-NEXT:    [[R:%.*]] = icmp eq i8 [[S]], 0
; CHECK-NEXT:    ret i1 [[R]]
;
  %ynz = icmp ne i8 %y, 0
  call void @llvm.assume(i1 %ynz)
  %pcond0 = icmp sge i8 %C, 0
  call void @llvm.assume(i1 %pcond0)
  %cmp = icmp slt i8 %C, %v
  %s = select i1 %cmp, i8 %v, i8 %y
  %r = icmp eq i8 %s, 0
  ret i1 %r
}

define i1 @select_v_slt_nonneg_fail(i8 %v, i8 %C, i8 %y) {
; CHECK-LABEL: @select_v_slt_nonneg_fail(
; CHECK-NEXT:    [[YNZ:%.*]] = icmp ne i8 [[Y:%.*]], 0
; CHECK-NEXT:    call void @llvm.assume(i1 [[YNZ]])
; CHECK-NEXT:    [[PCOND0:%.*]] = icmp sge i8 [[C:%.*]], -1
; CHECK-NEXT:    call void @llvm.assume(i1 [[PCOND0]])
; CHECK-NEXT:    [[CMP:%.*]] = icmp slt i8 [[C]], [[V:%.*]]
; CHECK-NEXT:    [[S:%.*]] = select i1 [[CMP]], i8 [[V]], i8 [[Y]]
; CHECK-NEXT:    [[R:%.*]] = icmp eq i8 [[S]], 0
; CHECK-NEXT:    ret i1 [[R]]
;
  %ynz = icmp ne i8 %y, 0
  call void @llvm.assume(i1 %ynz)
  %pcond0 = icmp sge i8 %C, -1
  call void @llvm.assume(i1 %pcond0)
  %cmp = icmp slt i8 %C, %v
  %s = select i1 %cmp, i8 %v, i8 %y
  %r = icmp eq i8 %s, 0
  ret i1 %r
}

define i1 @select_v_slt_neg(i8 %v, i8 %C, i8 %y) {
; CHECK-LABEL: @select_v_slt_neg(
; CHECK-NEXT:    [[YNZ:%.*]] = icmp ne i8 [[Y:%.*]], 0
; CHECK-NEXT:    call void @llvm.assume(i1 [[YNZ]])
; CHECK-NEXT:    [[PCOND0:%.*]] = icmp slt i8 [[C:%.*]], 0
; CHECK-NEXT:    call void @llvm.assume(i1 [[PCOND0]])
; CHECK-NEXT:    [[CMP:%.*]] = icmp slt i8 [[V:%.*]], [[C]]
; CHECK-NEXT:    [[S:%.*]] = select i1 [[CMP]], i8 [[V]], i8 [[Y]]
; CHECK-NEXT:    [[R:%.*]] = icmp eq i8 [[S]], 0
; CHECK-NEXT:    ret i1 [[R]]
;
  %ynz = icmp ne i8 %y, 0
  call void @llvm.assume(i1 %ynz)
  %pcond0 = icmp slt i8 %C, 0
  call void @llvm.assume(i1 %pcond0)
  %cmp = icmp slt i8 %v, %C
  %s = select i1 %cmp, i8 %v, i8 %y
  %r = icmp eq i8 %s, 0
  ret i1 %r
}

define i1 @select_v_sge_nonneg_nz(i8 %v, i8 %C, i8 %y) {
; CHECK-LABEL: @select_v_sge_nonneg_nz(
; CHECK-NEXT:    [[YNZ:%.*]] = icmp ne i8 [[Y:%.*]], 0
; CHECK-NEXT:    call void @llvm.assume(i1 [[YNZ]])
; CHECK-NEXT:    [[PCOND0:%.*]] = icmp sgt i8 [[C:%.*]], 0
; CHECK-NEXT:    call void @llvm.assume(i1 [[PCOND0]])
; CHECK-NEXT:    [[CMP:%.*]] = icmp sge i8 [[V:%.*]], [[C]]
; CHECK-NEXT:    [[S:%.*]] = select i1 [[CMP]], i8 [[V]], i8 [[Y]]
; CHECK-NEXT:    [[R:%.*]] = icmp eq i8 [[S]], 0
; CHECK-NEXT:    ret i1 [[R]]
;
  %ynz = icmp ne i8 %y, 0
  call void @llvm.assume(i1 %ynz)
  %pcond0 = icmp sgt i8 %C, 0
  call void @llvm.assume(i1 %pcond0)
  %cmp = icmp sge i8 %v, %C
  %s = select i1 %cmp, i8 %v, i8 %y
  %r = icmp eq i8 %s, 0
  ret i1 %r
}

define i1 @select_v_sge_neg(i8 %v, i8 %C, i8 %y) {
; CHECK-LABEL: @select_v_sge_neg(
; CHECK-NEXT:    [[YNZ:%.*]] = icmp ne i8 [[Y:%.*]], 0
; CHECK-NEXT:    call void @llvm.assume(i1 [[YNZ]])
; CHECK-NEXT:    [[PCOND0:%.*]] = icmp slt i8 [[C:%.*]], 0
; CHECK-NEXT:    call void @llvm.assume(i1 [[PCOND0]])
; CHECK-NEXT:    [[CMP:%.*]] = icmp sge i8 [[C]], [[V:%.*]]
; CHECK-NEXT:    [[S:%.*]] = select i1 [[CMP]], i8 [[V]], i8 [[Y]]
; CHECK-NEXT:    [[R:%.*]] = icmp eq i8 [[S]], 0
; CHECK-NEXT:    ret i1 [[R]]
;
  %ynz = icmp ne i8 %y, 0
  call void @llvm.assume(i1 %ynz)
  %pcond0 = icmp slt i8 %C, 0
  call void @llvm.assume(i1 %pcond0)
  %cmp = icmp sge i8 %C, %v
  %s = select i1 %cmp, i8 %v, i8 %y
  %r = icmp eq i8 %s, 0
  ret i1 %r
}

define i1 @inv_select_v_sge_fail(i8 %v, i8 %C, i8 %y) {
; CHECK-LABEL: @inv_select_v_sge_fail(
; CHECK-NEXT:    [[YNZ:%.*]] = icmp ne i8 [[Y:%.*]], 0
; CHECK-NEXT:    call void @llvm.assume(i1 [[YNZ]])
; CHECK-NEXT:    [[CMP:%.*]] = icmp sge i8 [[V:%.*]], [[C:%.*]]
; CHECK-NEXT:    [[S:%.*]] = select i1 [[CMP]], i8 [[Y]], i8 [[V]]
; CHECK-NEXT:    [[R:%.*]] = icmp eq i8 [[S]], 0
; CHECK-NEXT:    ret i1 [[R]]
;
  %ynz = icmp ne i8 %y, 0
  call void @llvm.assume(i1 %ynz)
  %cmp = icmp sge i8 %v, %C
  %s = select i1 %cmp, i8 %y, i8 %v
  %r = icmp eq i8 %s, 0
  ret i1 %r
}

define i1 @select_v_sle_neg(i8 %v, i8 %C, i8 %y) {
; CHECK-LABEL: @select_v_sle_neg(
; CHECK-NEXT:    [[YNZ:%.*]] = icmp ne i8 [[Y:%.*]], 0
; CHECK-NEXT:    call void @llvm.assume(i1 [[YNZ]])
; CHECK-NEXT:    [[PCOND0:%.*]] = icmp slt i8 [[C:%.*]], 0
; CHECK-NEXT:    call void @llvm.assume(i1 [[PCOND0]])
; CHECK-NEXT:    [[CMP:%.*]] = icmp sle i8 [[V:%.*]], [[C]]
; CHECK-NEXT:    [[S:%.*]] = select i1 [[CMP]], i8 [[V]], i8 [[Y]]
; CHECK-NEXT:    [[R:%.*]] = icmp eq i8 [[S]], 0
; CHECK-NEXT:    ret i1 [[R]]
;
  %ynz = icmp ne i8 %y, 0
  call void @llvm.assume(i1 %ynz)
  %pcond0 = icmp slt i8 %C, 0
  call void @llvm.assume(i1 %pcond0)
  %cmp = icmp sle i8 %v, %C
  %s = select i1 %cmp, i8 %v, i8 %y
  %r = icmp eq i8 %s, 0
  ret i1 %r
}

define i1 @select_v_sle_nonneg_nz(i8 %v, i8 %C, i8 %y) {
; CHECK-LABEL: @select_v_sle_nonneg_nz(
; CHECK-NEXT:    [[YNZ:%.*]] = icmp ne i8 [[Y:%.*]], 0
; CHECK-NEXT:    call void @llvm.assume(i1 [[YNZ]])
; CHECK-NEXT:    [[PCOND0:%.*]] = icmp sgt i8 [[C:%.*]], 0
; CHECK-NEXT:    call void @llvm.assume(i1 [[PCOND0]])
; CHECK-NEXT:    [[CMP:%.*]] = icmp sle i8 [[C]], [[V:%.*]]
; CHECK-NEXT:    [[S:%.*]] = select i1 [[CMP]], i8 [[V]], i8 [[Y]]
; CHECK-NEXT:    [[R:%.*]] = icmp eq i8 [[S]], 0
; CHECK-NEXT:    ret i1 [[R]]
;
  %ynz = icmp ne i8 %y, 0
  call void @llvm.assume(i1 %ynz)
  %pcond0 = icmp sgt i8 %C, 0
  call void @llvm.assume(i1 %pcond0)
  %cmp = icmp sle i8 %C, %v
  %s = select i1 %cmp, i8 %v, i8 %y
  %r = icmp eq i8 %s, 0
  ret i1 %r
}

define i1 @select_v_sle_fail(i8 %v, i8 %C, i8 %y) {
; CHECK-LABEL: @select_v_sle_fail(
; CHECK-NEXT:    [[YNZ:%.*]] = icmp ne i8 [[Y:%.*]], 0
; CHECK-NEXT:    call void @llvm.assume(i1 [[YNZ]])
; CHECK-NEXT:    [[PCOND0:%.*]] = icmp sge i8 [[C:%.*]], 0
; CHECK-NEXT:    call void @llvm.assume(i1 [[PCOND0]])
; CHECK-NEXT:    [[CMP:%.*]] = icmp sle i8 [[C]], [[V:%.*]]
; CHECK-NEXT:    [[S:%.*]] = select i1 [[CMP]], i8 [[V]], i8 [[Y]]
; CHECK-NEXT:    [[R:%.*]] = icmp eq i8 [[S]], 0
; CHECK-NEXT:    ret i1 [[R]]
;
  %ynz = icmp ne i8 %y, 0
  call void @llvm.assume(i1 %ynz)
  %pcond0 = icmp sge i8 %C, 0
  call void @llvm.assume(i1 %pcond0)
  %cmp = icmp sle i8 %C, %v
  %s = select i1 %cmp, i8 %v, i8 %y
  %r = icmp eq i8 %s, 0
  ret i1 %r
}

define i1 @inv_select_v_sle_nonneg(i8 %v, i8 %C, i8 %y) {
; CHECK-LABEL: @inv_select_v_sle_nonneg(
; CHECK-NEXT:    [[YNZ:%.*]] = icmp ne i8 [[Y:%.*]], 0
; CHECK-NEXT:    call void @llvm.assume(i1 [[YNZ]])
; CHECK-NEXT:    [[PCOND0:%.*]] = icmp sge i8 [[C:%.*]], 0
; CHECK-NEXT:    call void @llvm.assume(i1 [[PCOND0]])
; CHECK-NEXT:    [[CMP:%.*]] = icmp sle i8 [[V:%.*]], [[C]]
; CHECK-NEXT:    [[S:%.*]] = select i1 [[CMP]], i8 [[Y]], i8 [[V]]
; CHECK-NEXT:    [[R:%.*]] = icmp eq i8 [[S]], 0
; CHECK-NEXT:    ret i1 [[R]]
;
  %ynz = icmp ne i8 %y, 0
  call void @llvm.assume(i1 %ynz)
  %pcond0 = icmp sge i8 %C, 0
  call void @llvm.assume(i1 %pcond0)
  %cmp = icmp sle i8 %v, %C
  %s = select i1 %cmp, i8 %y, i8 %v
  %r = icmp eq i8 %s, 0
  ret i1 %r
}

; Check udiv/sdiv occuring before icmp.
define i64 @incorrect_safe_div_1(i64 %n, i64 %d) {
; CHECK-LABEL: @incorrect_safe_div_1(
; CHECK-NEXT:    [[TMP1:%.*]] = udiv i64 [[N:%.*]], [[D:%.*]]
; CHECK-NEXT:    ret i64 [[TMP1]]
;
  %1 = udiv i64 %n, %d
  %2 = icmp eq i64 %d, 0
  %3 = select i1 %2, i64 -1, i64 %1
  ret i64 %3
}

; Check icmp occuring before udiv/sdiv.
define i64 @incorrect_safe_div_2(i64 %n, i64 %d) {
; CHECK-LABEL: @incorrect_safe_div_2(
; CHECK-NEXT:    [[TMP1:%.*]] = sdiv i64 [[N:%.*]], [[D:%.*]]
; CHECK-NEXT:    ret i64 [[TMP1]]
;
  %1 = icmp eq i64 %d, 0
  %2 = sdiv i64 %n, %d
  %3 = select i1 %1, i64 -1, i64 %2
  ret i64 %3
}

define i64 @incorrect_safe_div_call_1(i64 %n, i64 %d) {
; CHECK-LABEL: @incorrect_safe_div_call_1(
; CHECK-NEXT:    [[TMP1:%.*]] = sdiv i64 [[N:%.*]], [[D:%.*]]
; CHECK-NEXT:    tail call void @use(i64 [[D]])
; CHECK-NEXT:    ret i64 [[TMP1]]
;
  %1 = sdiv i64 %n, %d
  tail call void @use(i64 %d)
  %2 = icmp eq i64 %d, 0
  %3 = select i1 %2, i64 -1, i64 %1
  ret i64 %3
}

define i64 @incorrect_safe_div_call_2(i64 %n, i64 %d) {
; CHECK-LABEL: @incorrect_safe_div_call_2(
; CHECK-NEXT:    [[TMP1:%.*]] = icmp eq i64 [[D:%.*]], 0
; CHECK-NEXT:    tail call void @use(i64 [[D]])
; CHECK-NEXT:    [[TMP2:%.*]] = udiv i64 [[N:%.*]], [[D]]
; CHECK-NEXT:    [[TMP3:%.*]] = select i1 [[TMP1]], i64 -1, i64 [[TMP2]]
; CHECK-NEXT:    ret i64 [[TMP3]]
;
  %1 = icmp eq i64 %d, 0
  tail call void @use(i64 %d)
  %2 = udiv i64 %n, %d
  %3 = select i1 %1, i64 -1, i64 %2
  ret i64 %3
}

declare void @use(i64)
