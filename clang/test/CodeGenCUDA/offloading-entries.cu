// NOTE: Assertions have been autogenerated by utils/update_cc_test_checks.py UTC_ARGS: --check-globals --global-value-regex ".omp_offloading.entry.*"
// RUN: %clang_cc1 -std=c++11 -triple x86_64-unknown-linux-gnu -fgpu-rdc \
// RUN:   --offload-new-driver -emit-llvm -o - -x cuda  %s | FileCheck \
// RUN:   --check-prefix=CUDA %s
// RUN: %clang_cc1 -std=c++11 -triple x86_64-unknown-linux-gnu -fgpu-rdc \
// RUN:   --offload-new-driver -emit-llvm -o - -x hip  %s | FileCheck \
// RUN:   --check-prefix=HIP %s
// RUN: %clang_cc1 -std=c++11 -triple x86_64-unknown-windows-gnu -fgpu-rdc \
// RUN:   --offload-new-driver -emit-llvm -o - -x cuda  %s | FileCheck \
// RUN:   --check-prefix=CUDA-COFF %s
// RUN: %clang_cc1 -std=c++11 -triple x86_64-unknown-windows-gnu -fgpu-rdc \
// RUN:   --offload-new-driver -emit-llvm -o - -x hip  %s | FileCheck \
// RUN:   --check-prefix=HIP-COFF %s

#include "Inputs/cuda.h"

//.
// CUDA: @.omp_offloading.entry_name = internal unnamed_addr constant [8 x i8] c"_Z3foov\00"
// CUDA: @.omp_offloading.entry._Z3foov = weak constant %struct.__tgt_offload_entry { ptr @_Z18__device_stub__foov, ptr @.omp_offloading.entry_name, i64 0, i32 0, i32 0 }, section "cuda_offloading_entries", align 1
// CUDA: @.omp_offloading.entry_name.1 = internal unnamed_addr constant [8 x i8] c"_Z3barv\00"
// CUDA: @.omp_offloading.entry._Z3barv = weak constant %struct.__tgt_offload_entry { ptr @_Z18__device_stub__barv, ptr @.omp_offloading.entry_name.1, i64 0, i32 0, i32 0 }, section "cuda_offloading_entries", align 1
// CUDA: @.omp_offloading.entry_name.2 = internal unnamed_addr constant [2 x i8] c"x\00"
// CUDA: @.omp_offloading.entry.x = weak constant %struct.__tgt_offload_entry { ptr @x, ptr @.omp_offloading.entry_name.2, i64 4, i32 0, i32 0 }, section "cuda_offloading_entries", align 1
//.
// HIP: @.omp_offloading.entry_name = internal unnamed_addr constant [8 x i8] c"_Z3foov\00"
// HIP: @.omp_offloading.entry._Z3foov = weak constant %struct.__tgt_offload_entry { ptr @_Z3foov, ptr @.omp_offloading.entry_name, i64 0, i32 0, i32 0 }, section "hip_offloading_entries", align 1
// HIP: @.omp_offloading.entry_name.1 = internal unnamed_addr constant [8 x i8] c"_Z3barv\00"
// HIP: @.omp_offloading.entry._Z3barv = weak constant %struct.__tgt_offload_entry { ptr @_Z3barv, ptr @.omp_offloading.entry_name.1, i64 0, i32 0, i32 0 }, section "hip_offloading_entries", align 1
// HIP: @.omp_offloading.entry_name.2 = internal unnamed_addr constant [2 x i8] c"x\00"
// HIP: @.omp_offloading.entry.x = weak constant %struct.__tgt_offload_entry { ptr @x, ptr @.omp_offloading.entry_name.2, i64 4, i32 0, i32 0 }, section "hip_offloading_entries", align 1
//.
// CUDA-COFF: @.omp_offloading.entry_name = internal unnamed_addr constant [8 x i8] c"_Z3foov\00"
// CUDA-COFF: @.omp_offloading.entry._Z3foov = weak constant %struct.__tgt_offload_entry { ptr @_Z18__device_stub__foov, ptr @.omp_offloading.entry_name, i64 0, i32 0, i32 0 }, section "cuda_offloading_entries$OE", align 1
// CUDA-COFF: @.omp_offloading.entry_name.1 = internal unnamed_addr constant [8 x i8] c"_Z3barv\00"
// CUDA-COFF: @.omp_offloading.entry._Z3barv = weak constant %struct.__tgt_offload_entry { ptr @_Z18__device_stub__barv, ptr @.omp_offloading.entry_name.1, i64 0, i32 0, i32 0 }, section "cuda_offloading_entries$OE", align 1
// CUDA-COFF: @.omp_offloading.entry_name.2 = internal unnamed_addr constant [2 x i8] c"x\00"
// CUDA-COFF: @.omp_offloading.entry.x = weak constant %struct.__tgt_offload_entry { ptr @x, ptr @.omp_offloading.entry_name.2, i64 4, i32 0, i32 0 }, section "cuda_offloading_entries$OE", align 1
//.
// HIP-COFF: @.omp_offloading.entry_name = internal unnamed_addr constant [8 x i8] c"_Z3foov\00"
// HIP-COFF: @.omp_offloading.entry._Z3foov = weak constant %struct.__tgt_offload_entry { ptr @_Z3foov, ptr @.omp_offloading.entry_name, i64 0, i32 0, i32 0 }, section "hip_offloading_entries$OE", align 1
// HIP-COFF: @.omp_offloading.entry_name.1 = internal unnamed_addr constant [8 x i8] c"_Z3barv\00"
// HIP-COFF: @.omp_offloading.entry._Z3barv = weak constant %struct.__tgt_offload_entry { ptr @_Z3barv, ptr @.omp_offloading.entry_name.1, i64 0, i32 0, i32 0 }, section "hip_offloading_entries$OE", align 1
// HIP-COFF: @.omp_offloading.entry_name.2 = internal unnamed_addr constant [2 x i8] c"x\00"
// HIP-COFF: @.omp_offloading.entry.x = weak constant %struct.__tgt_offload_entry { ptr @x, ptr @.omp_offloading.entry_name.2, i64 4, i32 0, i32 0 }, section "hip_offloading_entries$OE", align 1
//.
// CUDA-LABEL: @_Z18__device_stub__foov(
// CUDA-NEXT:  entry:
// CUDA-NEXT:    [[TMP0:%.*]] = call i32 @cudaLaunch(ptr @_Z18__device_stub__foov)
// CUDA-NEXT:    br label [[SETUP_END:%.*]]
// CUDA:       setup.end:
// CUDA-NEXT:    ret void
//
// HIP-LABEL: @_Z18__device_stub__foov(
// HIP-NEXT:  entry:
// HIP-NEXT:    [[TMP0:%.*]] = call i32 @hipLaunchByPtr(ptr @_Z3foov)
// HIP-NEXT:    br label [[SETUP_END:%.*]]
// HIP:       setup.end:
// HIP-NEXT:    ret void
//
// CUDA-COFF-LABEL: @_Z18__device_stub__foov(
// CUDA-COFF-NEXT:  entry:
// CUDA-COFF-NEXT:    [[TMP0:%.*]] = call i32 @cudaLaunch(ptr @_Z18__device_stub__foov)
// CUDA-COFF-NEXT:    br label [[SETUP_END:%.*]]
// CUDA-COFF:       setup.end:
// CUDA-COFF-NEXT:    ret void
//
// HIP-COFF-LABEL: @_Z18__device_stub__foov(
// HIP-COFF-NEXT:  entry:
// HIP-COFF-NEXT:    [[TMP0:%.*]] = call i32 @hipLaunchByPtr(ptr @_Z3foov)
// HIP-COFF-NEXT:    br label [[SETUP_END:%.*]]
// HIP-COFF:       setup.end:
// HIP-COFF-NEXT:    ret void
//
__global__ void foo() {}

// CUDA-LABEL: @_Z18__device_stub__barv(
// CUDA-NEXT:  entry:
// CUDA-NEXT:    [[TMP0:%.*]] = call i32 @cudaLaunch(ptr @_Z18__device_stub__barv)
// CUDA-NEXT:    br label [[SETUP_END:%.*]]
// CUDA:       setup.end:
// CUDA-NEXT:    ret void
//
// HIP-LABEL: @_Z18__device_stub__barv(
// HIP-NEXT:  entry:
// HIP-NEXT:    [[TMP0:%.*]] = call i32 @hipLaunchByPtr(ptr @_Z3barv)
// HIP-NEXT:    br label [[SETUP_END:%.*]]
// HIP:       setup.end:
// HIP-NEXT:    ret void
//
// CUDA-COFF-LABEL: @_Z18__device_stub__barv(
// CUDA-COFF-NEXT:  entry:
// CUDA-COFF-NEXT:    [[TMP0:%.*]] = call i32 @cudaLaunch(ptr @_Z18__device_stub__barv)
// CUDA-COFF-NEXT:    br label [[SETUP_END:%.*]]
// CUDA-COFF:       setup.end:
// CUDA-COFF-NEXT:    ret void
//
// HIP-COFF-LABEL: @_Z18__device_stub__barv(
// HIP-COFF-NEXT:  entry:
// HIP-COFF-NEXT:    [[TMP0:%.*]] = call i32 @hipLaunchByPtr(ptr @_Z3barv)
// HIP-COFF-NEXT:    br label [[SETUP_END:%.*]]
// HIP-COFF:       setup.end:
// HIP-COFF-NEXT:    ret void
//
__global__ void bar() {}
__device__ int x = 1;
