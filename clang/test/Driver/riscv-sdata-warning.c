// REQUIRES: riscv-registered-target
// RUN: %clang -S --target=riscv32-unknown-elf -fpic -msmall-data-limit=8 %s 2>&1 \
// RUN:   | FileCheck -check-prefix=CHECK-PIC-SDATA %s
// CHECK-PIC-SDATA: warning: ignoring '-msmall-data-limit=' with -mcmodel=large for -fpic or RV64
