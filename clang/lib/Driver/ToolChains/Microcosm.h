//===--- Microcosm.h - Microcosm ToolChain -----------------------*- C++-*-===//
//
// Part of the Microcosm project, under the Apache License v2.0 with LLVM
// Exceptions. See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_CLANG_LIB_DRIVER_TOOLCHAINS_MICROCOSM_H
#define LLVM_CLANG_LIB_DRIVER_TOOLCHAINS_MICROCOSM_H

#include "clang/Driver/ToolChain.h"

namespace clang {
namespace driver {

namespace toolchains {

class LLVM_LIBRARY_VISIBILITY Microcosm : public ToolChain {
  Microcosm(const Driver &D, const llvm::Triple &Triple,
           const llvm::opt::ArgList &Args);
  ~Microcosm() override = default;
};

} // namespace toolchains

} // namespace driver
} // namespace clang

#endif // not LLVM_CLANG_LIB_DRIVER_TOOLCHAINS_MICROCOSM_H
