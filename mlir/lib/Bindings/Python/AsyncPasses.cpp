//===- AsyncPasses.cpp - Pybind module for the Async passes -------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "mlir-c/Dialect/Async.h"

#include <pybind11/detail/common.h>
#include <pybind11/pybind11.h>

// -----------------------------------------------------------------------------
// Module initialization.
// -----------------------------------------------------------------------------

PYBIND11_MODULE(_mlirAsyncPasses, m) {
  m.doc() = "MLIR Async Dialect Passes";

  // Register all Async passes on load.
  mlirRegisterAsyncPasses();
}
