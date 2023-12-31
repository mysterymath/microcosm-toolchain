; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -verify-machineinstrs -csky-no-aliases < %s -mtriple=csky -mattr=+2e3 | FileCheck %s
; RUN: llc -verify-machineinstrs -csky-no-aliases < %s -mtriple=csky -relocation-model=pic -code-model=small -mattr=+2e3 | FileCheck %s --check-prefix=CHECK-PIC-SMALL
; RUN: llc -verify-machineinstrs -csky-no-aliases < %s -mtriple=csky -relocation-model=pic -code-model=large -mattr=+2e3 | FileCheck %s --check-prefix=CHECK-PIC-LARGE

define i32 @f(i32 %val) {
; CHECK-LABEL: f:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    movi16 a1, 4
; CHECK-NEXT:    cmphs16 a1, a0
; CHECK-NEXT:    bf32 .LBB0_7
; CHECK-NEXT:  # %bb.1: # %entry
; CHECK-NEXT:    lrw32 a1, [.LCPI0_0]
; CHECK-NEXT:    ldr32.w a0, (a1, a0 << 2)
; CHECK-NEXT:    jmp32 a0
; CHECK-NEXT:  .LBB0_2: # %onzero
; CHECK-NEXT:    movi16 a0, 0
; CHECK-NEXT:    rts16
; CHECK-NEXT:  .LBB0_3: # %onthree
; CHECK-NEXT:    movi16 a0, 3
; CHECK-NEXT:    rts16
; CHECK-NEXT:  .LBB0_4: # %ontwo
; CHECK-NEXT:    movi16 a0, 2
; CHECK-NEXT:    rts16
; CHECK-NEXT:  .LBB0_5: # %onfour
; CHECK-NEXT:    movi16 a0, 4
; CHECK-NEXT:    rts16
; CHECK-NEXT:  .LBB0_6: # %onone
; CHECK-NEXT:    movi16 a0, 1
; CHECK-NEXT:    rts16
; CHECK-NEXT:  .LBB0_7: # %otherwise
; CHECK-NEXT:    movih32 a0, 65535
; CHECK-NEXT:    ori32 a0, a0, 65535
; CHECK-NEXT:    rts16
; CHECK-NEXT:    .p2align 1
; CHECK-NEXT:  # %bb.8:
; CHECK-NEXT:    .p2align 2, 0x0
; CHECK-NEXT:  .LCPI0_0:
; CHECK-NEXT:    .long .LJTI0_0
;
; CHECK-PIC-SMALL-LABEL: f:
; CHECK-PIC-SMALL:       # %bb.0: # %entry
; CHECK-PIC-SMALL-NEXT:    subi16 sp, sp, 4
; CHECK-PIC-SMALL-NEXT:    .cfi_def_cfa_offset 4
; CHECK-PIC-SMALL-NEXT:    st32.w rgb, (sp, 0) # 4-byte Folded Spill
; CHECK-PIC-SMALL-NEXT:    .cfi_offset rgb, -4
; CHECK-PIC-SMALL-NEXT:    .cfi_def_cfa_offset 4
; CHECK-PIC-SMALL-NEXT:    lrw32 rgb, [.LCPI0_0]
; CHECK-PIC-SMALL-NEXT:    movi16 a1, 4
; CHECK-PIC-SMALL-NEXT:    cmphs16 a1, a0
; CHECK-PIC-SMALL-NEXT:    bf32 .LBB0_7
; CHECK-PIC-SMALL-NEXT:  # %bb.1: # %entry
; CHECK-PIC-SMALL-NEXT:    lrw32 a1, [.LCPI0_1]
; CHECK-PIC-SMALL-NEXT:    addu32 a1, rgb, a1
; CHECK-PIC-SMALL-NEXT:    ldr32.w a0, (a1, a0 << 2)
; CHECK-PIC-SMALL-NEXT:    addu16 a0, a1
; CHECK-PIC-SMALL-NEXT:    jmp32 a0
; CHECK-PIC-SMALL-NEXT:  .LBB0_2: # %onzero
; CHECK-PIC-SMALL-NEXT:    movi16 a0, 0
; CHECK-PIC-SMALL-NEXT:    br32 .LBB0_8
; CHECK-PIC-SMALL-NEXT:  .LBB0_3: # %onthree
; CHECK-PIC-SMALL-NEXT:    movi16 a0, 3
; CHECK-PIC-SMALL-NEXT:    br32 .LBB0_8
; CHECK-PIC-SMALL-NEXT:  .LBB0_4: # %ontwo
; CHECK-PIC-SMALL-NEXT:    movi16 a0, 2
; CHECK-PIC-SMALL-NEXT:    br32 .LBB0_8
; CHECK-PIC-SMALL-NEXT:  .LBB0_5: # %onfour
; CHECK-PIC-SMALL-NEXT:    movi16 a0, 4
; CHECK-PIC-SMALL-NEXT:    br32 .LBB0_8
; CHECK-PIC-SMALL-NEXT:  .LBB0_6: # %onone
; CHECK-PIC-SMALL-NEXT:    movi16 a0, 1
; CHECK-PIC-SMALL-NEXT:    br32 .LBB0_8
; CHECK-PIC-SMALL-NEXT:  .LBB0_7: # %otherwise
; CHECK-PIC-SMALL-NEXT:    movih32 a0, 65535
; CHECK-PIC-SMALL-NEXT:    ori32 a0, a0, 65535
; CHECK-PIC-SMALL-NEXT:  .LBB0_8: # %onone
; CHECK-PIC-SMALL-NEXT:    ld32.w rgb, (sp, 0) # 4-byte Folded Reload
; CHECK-PIC-SMALL-NEXT:    addi16 sp, sp, 4
; CHECK-PIC-SMALL-NEXT:    rts16
; CHECK-PIC-SMALL-NEXT:    .p2align 1
; CHECK-PIC-SMALL-NEXT:  # %bb.9:
; CHECK-PIC-SMALL-NEXT:    .p2align 2, 0x0
; CHECK-PIC-SMALL-NEXT:  .LCPI0_0:
; CHECK-PIC-SMALL-NEXT:    .long _GLOBAL_OFFSET_TABLE_
; CHECK-PIC-SMALL-NEXT:  .LCPI0_1:
; CHECK-PIC-SMALL-NEXT:    .long .LJTI0_0@GOTOFF
;
; CHECK-PIC-LARGE-LABEL: f:
; CHECK-PIC-LARGE:       # %bb.0: # %entry
; CHECK-PIC-LARGE-NEXT:    subi16 sp, sp, 4
; CHECK-PIC-LARGE-NEXT:    .cfi_def_cfa_offset 4
; CHECK-PIC-LARGE-NEXT:    st32.w rgb, (sp, 0) # 4-byte Folded Spill
; CHECK-PIC-LARGE-NEXT:    .cfi_offset rgb, -4
; CHECK-PIC-LARGE-NEXT:    .cfi_def_cfa_offset 4
; CHECK-PIC-LARGE-NEXT:    lrw32 rgb, [.LCPI0_0]
; CHECK-PIC-LARGE-NEXT:    movi16 a1, 4
; CHECK-PIC-LARGE-NEXT:    cmphs16 a1, a0
; CHECK-PIC-LARGE-NEXT:    bf32 .LBB0_7
; CHECK-PIC-LARGE-NEXT:  # %bb.1: # %entry
; CHECK-PIC-LARGE-NEXT:    lrw32 a1, [.LCPI0_1]
; CHECK-PIC-LARGE-NEXT:    addu32 a1, rgb, a1
; CHECK-PIC-LARGE-NEXT:    ldr32.w a0, (a1, a0 << 2)
; CHECK-PIC-LARGE-NEXT:    addu16 a0, a1
; CHECK-PIC-LARGE-NEXT:    jmp32 a0
; CHECK-PIC-LARGE-NEXT:  .LBB0_2: # %onzero
; CHECK-PIC-LARGE-NEXT:    movi16 a0, 0
; CHECK-PIC-LARGE-NEXT:    br32 .LBB0_8
; CHECK-PIC-LARGE-NEXT:  .LBB0_3: # %onthree
; CHECK-PIC-LARGE-NEXT:    movi16 a0, 3
; CHECK-PIC-LARGE-NEXT:    br32 .LBB0_8
; CHECK-PIC-LARGE-NEXT:  .LBB0_4: # %ontwo
; CHECK-PIC-LARGE-NEXT:    movi16 a0, 2
; CHECK-PIC-LARGE-NEXT:    br32 .LBB0_8
; CHECK-PIC-LARGE-NEXT:  .LBB0_5: # %onfour
; CHECK-PIC-LARGE-NEXT:    movi16 a0, 4
; CHECK-PIC-LARGE-NEXT:    br32 .LBB0_8
; CHECK-PIC-LARGE-NEXT:  .LBB0_6: # %onone
; CHECK-PIC-LARGE-NEXT:    movi16 a0, 1
; CHECK-PIC-LARGE-NEXT:    br32 .LBB0_8
; CHECK-PIC-LARGE-NEXT:  .LBB0_7: # %otherwise
; CHECK-PIC-LARGE-NEXT:    movih32 a0, 65535
; CHECK-PIC-LARGE-NEXT:    ori32 a0, a0, 65535
; CHECK-PIC-LARGE-NEXT:  .LBB0_8: # %onone
; CHECK-PIC-LARGE-NEXT:    ld32.w rgb, (sp, 0) # 4-byte Folded Reload
; CHECK-PIC-LARGE-NEXT:    addi16 sp, sp, 4
; CHECK-PIC-LARGE-NEXT:    rts16
; CHECK-PIC-LARGE-NEXT:    .p2align 1
; CHECK-PIC-LARGE-NEXT:  # %bb.9:
; CHECK-PIC-LARGE-NEXT:    .p2align 2, 0x0
; CHECK-PIC-LARGE-NEXT:  .LCPI0_0:
; CHECK-PIC-LARGE-NEXT:    .long _GLOBAL_OFFSET_TABLE_
; CHECK-PIC-LARGE-NEXT:  .LCPI0_1:
; CHECK-PIC-LARGE-NEXT:    .long .LJTI0_0@GOTOFF
entry:
  switch i32 %val, label %otherwise [ i32 0, label %onzero
                                      i32 1, label %onone
                                      i32 3, label %onfour
                                      i32 4, label %onthree
                                      i32 2, label %ontwo ]
onone:
  ret i32 1
ontwo:
  ret i32 2
onzero:
  ret i32 0
onfour:
  ret i32 4
onthree:
  ret i32 3
otherwise:
  ret i32 -1
}
