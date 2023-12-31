; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mcpu=pwr8 -ppc-asm-full-reg-names --enable-unsafe-fp-math \
; RUN:   -verify-machineinstrs --enable-no-signed-zeros-fp-math \
; RUN:   --enable-no-nans-fp-math --enable-no-infs-fp-math \
; RUN:   -mtriple=powerpc64le-unknown-unknown < %s | FileCheck %s \
; RUN:   --check-prefix=FAST-P8
; RUN: llc -mcpu=pwr9 -ppc-asm-full-reg-names --enable-unsafe-fp-math \
; RUN:   -verify-machineinstrs --enable-no-signed-zeros-fp-math \
; RUN:   --enable-no-nans-fp-math --enable-no-infs-fp-math \
; RUN:   -mtriple=powerpc64le-unknown-unknown < %s | FileCheck %s \
; RUN:   --check-prefix=FAST-P9
; RUN: llc -mcpu=pwr9 -ppc-asm-full-reg-names -verify-machineinstrs \
; RUN:   -mtriple=powerpc64le-unknown-unknown < %s | FileCheck %s \
; RUN:   --check-prefix=NO-FAST-P9
; RUN: llc -mcpu=pwr8 -ppc-asm-full-reg-names -verify-machineinstrs \
; RUN:   -mtriple=powerpc64le-unknown-unknown < %s | FileCheck %s \
; RUN:   --check-prefix=NO-FAST-P8

define double @testoeq(double %a, double %b, double %c, double %d) {
; FAST-P8-LABEL: testoeq:
; FAST-P8:       # %bb.0: # %entry
; FAST-P8-NEXT:    xssubdp f0, f1, f2
; FAST-P8-NEXT:    fsel f1, f0, f3, f4
; FAST-P8-NEXT:    xsnegdp f0, f0
; FAST-P8-NEXT:    fsel f1, f0, f1, f4
; FAST-P8-NEXT:    blr
;
; FAST-P9-LABEL: testoeq:
; FAST-P9:       # %bb.0: # %entry
; FAST-P9-NEXT:    xssubdp f0, f1, f2
; FAST-P9-NEXT:    fsel f1, f0, f3, f4
; FAST-P9-NEXT:    xsnegdp f0, f0
; FAST-P9-NEXT:    fsel f1, f0, f1, f4
; FAST-P9-NEXT:    blr
;
; NO-FAST-P9-LABEL: testoeq:
; NO-FAST-P9:       # %bb.0: # %entry
; NO-FAST-P9-NEXT:    xscmpudp cr0, f1, f2
; NO-FAST-P9-NEXT:    beq cr0, .LBB0_2
; NO-FAST-P9-NEXT:  # %bb.1: # %entry
; NO-FAST-P9-NEXT:    fmr f3, f4
; NO-FAST-P9-NEXT:  .LBB0_2: # %entry
; NO-FAST-P9-NEXT:    fmr f1, f3
; NO-FAST-P9-NEXT:    blr
;
; NO-FAST-P8-LABEL: testoeq:
; NO-FAST-P8:       # %bb.0: # %entry
; NO-FAST-P8-NEXT:    xscmpudp cr0, f1, f2
; NO-FAST-P8-NEXT:    beq cr0, .LBB0_2
; NO-FAST-P8-NEXT:  # %bb.1: # %entry
; NO-FAST-P8-NEXT:    fmr f3, f4
; NO-FAST-P8-NEXT:  .LBB0_2: # %entry
; NO-FAST-P8-NEXT:    fmr f1, f3
; NO-FAST-P8-NEXT:    blr
entry:
  %cmp = fcmp oeq double %a, %b
  %cond = select i1 %cmp, double %c, double %d
  ret double %cond
}

define double @testoeq_fast(double %a, double %b, double %c, double %d) {
; FAST-P8-LABEL: testoeq_fast:
; FAST-P8:       # %bb.0: # %entry
; FAST-P8-NEXT:    xssubdp f0, f1, f2
; FAST-P8-NEXT:    fsel f1, f0, f3, f4
; FAST-P8-NEXT:    xsnegdp f0, f0
; FAST-P8-NEXT:    fsel f1, f0, f1, f4
; FAST-P8-NEXT:    blr
;
; FAST-P9-LABEL: testoeq_fast:
; FAST-P9:       # %bb.0: # %entry
; FAST-P9-NEXT:    xssubdp f0, f1, f2
; FAST-P9-NEXT:    fsel f1, f0, f3, f4
; FAST-P9-NEXT:    xsnegdp f0, f0
; FAST-P9-NEXT:    fsel f1, f0, f1, f4
; FAST-P9-NEXT:    blr
;
; NO-FAST-P9-LABEL: testoeq_fast:
; NO-FAST-P9:       # %bb.0: # %entry
; NO-FAST-P9-NEXT:    xssubdp f0, f1, f2
; NO-FAST-P9-NEXT:    fsel f1, f0, f3, f4
; NO-FAST-P9-NEXT:    xsnegdp f0, f0
; NO-FAST-P9-NEXT:    fsel f1, f0, f1, f4
; NO-FAST-P9-NEXT:    blr
;
; NO-FAST-P8-LABEL: testoeq_fast:
; NO-FAST-P8:       # %bb.0: # %entry
; NO-FAST-P8-NEXT:    xssubdp f0, f1, f2
; NO-FAST-P8-NEXT:    fsel f1, f0, f3, f4
; NO-FAST-P8-NEXT:    xsnegdp f0, f0
; NO-FAST-P8-NEXT:    fsel f1, f0, f1, f4
; NO-FAST-P8-NEXT:    blr
entry:
  %cmp = fcmp nnan ninf nsz oeq double %a, %b
  %cond = select nnan ninf nsz i1 %cmp, double %c, double %d
  ret double %cond
}
