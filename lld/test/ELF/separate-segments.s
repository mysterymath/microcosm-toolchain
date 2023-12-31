# REQUIRES: x86
# RUN: llvm-mc -filetype=obj -triple=x86_64 %s -o %t.o

## -z noseparate-code is the default. All PT_LOAD can have overlapping p_offset
## ranges at runtime.
# RUN: ld.lld -pie %t.o -o %t
# RUN: llvm-readelf -l %t | FileCheck --check-prefix=NONE %s
# NONE:      LOAD 0x000000 0x0000000000000000 0x0000000000000000 0x000245 0x000245 R   0x1000
# NONE-NEXT: LOAD 0x000248 0x0000000000001248 0x0000000000001248 0x000001 0x000001 R E 0x1000
# NONE-NEXT: LOAD 0x000250 0x0000000000002250 0x0000000000002250 0x000090 0x000db0 RW  0x1000
# NONE-NEXT: LOAD 0x0002e0 0x00000000000032e0 0x00000000000032e0 0x000001 0x000001 RW  0x1000

## -z separate-code makes text segment (RX) separate.
## The two RW can have overlapping p_offset ranges at runtime.
# RUN: ld.lld -pie %t.o -z separate-code -o %t
# RUN: llvm-readelf -l %t | FileCheck --check-prefix=CODE %s
# CODE:      LOAD 0x000000 0x0000000000000000 0x0000000000000000 0x000245 0x000245 R   0x1000
# CODE-NEXT: LOAD 0x001000 0x0000000000001000 0x0000000000001000 0x000001 0x000001 R E 0x1000
# CODE-NEXT: LOAD 0x002000 0x0000000000002000 0x0000000000002000 0x000090 0x001000 RW  0x1000
# CODE-NEXT: LOAD 0x002090 0x0000000000003090 0x0000000000003090 0x000001 0x000001 RW  0x1000

## -z separate-loadable-segments makes all segments separate.
# RUN: ld.lld -pie %t.o -z separate-loadable-segments -o %t
# RUN: llvm-readelf -l %t | FileCheck --check-prefix=ALL %s
# ALL:       LOAD 0x000000 0x0000000000000000 0x0000000000000000 0x000245 0x000245 R   0x1000
# ALL-NEXT:  LOAD 0x001000 0x0000000000001000 0x0000000000001000 0x000001 0x000001 R E 0x1000
# ALL-NEXT:  LOAD 0x002000 0x0000000000002000 0x0000000000002000 0x000090 0x001000 RW  0x1000
# ALL-NEXT:  LOAD 0x003000 0x0000000000003000 0x0000000000003000 0x000001 0x000001 RW  0x1000

nop

.data
.byte 0
