//===-- Implementation of nexttowardf function ----------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "src/math/nexttowardf.h"
#include "src/__support/FPUtil/ManipulationFunctions.h"
#include "src/__support/common.h"

namespace LIBC_NAMESPACE {

LLVM_LIBC_FUNCTION(float, nexttowardf, (float x, long double y)) {
  return fputil::nexttoward(x, y);
}

} // namespace LIBC_NAMESPACE
