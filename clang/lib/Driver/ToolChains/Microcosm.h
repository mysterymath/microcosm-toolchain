//===--- Microcosm.h - Microcosm ToolChain -----------------------*- C++-*-===//
//
// Part of the Microcosm project, under the Apache License v2.0 with LLVM
// Exceptions. See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_CLANG_LIB_DRIVER_TOOLCHAINS_MICROCOSM_H
#define LLVM_CLANG_LIB_DRIVER_TOOLCHAINS_MICROCOSM_H

#include "clang/Driver/Tool.h"
#include "clang/Driver/ToolChain.h"

namespace clang {
namespace driver {

namespace toolchains {

class LLVM_LIBRARY_VISIBILITY Microcosm : public ToolChain {
public:
  Microcosm(const Driver &D, const llvm::Triple &Triple,
            const llvm::opt::ArgList &Args);
  ~Microcosm() override = default;

protected:
  Tool *buildLinker() const override;

  const char *getDefaultLinker() const override { return "ld.lld"; }

  bool isPICDefault() const override { return true; }
  bool isPIEDefault(const llvm::opt::ArgList &Args) const override {
    return true;
  }
  bool isPICDefaultForced() const override { return true; }
};

} // namespace toolchains

namespace tools {
namespace microcosm {

class LLVM_LIBRARY_VISIBILITY Linker final : public Tool {
public:
  Linker(const ToolChain &TC) : Tool("microcosm::Linker", "ld.lld", TC) {}
  bool isLinkJob() const override { return true; }
  bool hasIntegratedCPP() const override { return false; }
  void ConstructJob(Compilation &C, const JobAction &JA,
                    const InputInfo &Output, const InputInfoList &Inputs,
                    const llvm::opt::ArgList &TCArgs,
                    const char *LinkingOutput) const override;
};

} // namespace microcosm
} // namespace tools

} // namespace driver
} // namespace clang

#endif // not LLVM_CLANG_LIB_DRIVER_TOOLCHAINS_MICROCOSM_H
