#include "Microcosm.h"
#include "ToolChains/Arch/ARM.h"
#include "ToolChains/CommonArgs.h"

#include "clang/Driver/Compilation.h"
#include "clang/Driver/Driver.h"
#include "llvm/Option/ArgList.h"
#include "llvm/Support/Path.h"

using namespace llvm::opt;
using namespace clang;
using namespace clang::driver;
using namespace clang::driver::tools;
using namespace clang::driver::toolchains;

Microcosm::Microcosm(const Driver &D, const llvm::Triple &Triple,
                     const ArgList &Args)
    : ToolChain(D, Triple, Args) {
  getProgramPaths().push_back(getDriver().getInstalledDir());
  if (getDriver().getInstalledDir() != getDriver().Dir)
    getProgramPaths().push_back(getDriver().Dir);
}

Tool *Microcosm::buildLinker() const {
  return new tools::microcosm::Linker(*this);
}

void microcosm::Linker::ConstructJob(Compilation &C, const JobAction &JA,
                                     const InputInfo &Output,
                                     const InputInfoList &Inputs,
                                     const ArgList &Args,
                                     const char *LinkingOutput) const {
  ArgStringList CmdArgs;

  auto &TC = static_cast<const toolchains::Microcosm &>(getToolChain());
  const llvm::Triple &Triple = getToolChain().getEffectiveTriple();

  AddLinkerInputs(TC, Inputs, Args, CmdArgs, JA);

  if (Triple.isARM() || Triple.isThumb()) {
    bool IsBigEndian = arm::isARMBigEndian(Triple, Args);
    if (IsBigEndian)
      arm::appendBE8LinkFlag(Args, CmdArgs, Triple);
    CmdArgs.push_back(IsBigEndian ? "-EB" : "-EL");
  }

  Args.addAllArgs(CmdArgs, {options::OPT_L, options::OPT_T_Group,
                            options::OPT_s, options::OPT_t, options::OPT_r});

  TC.AddFilePathLibArgs(Args, CmdArgs);

  for (const auto &LibPath : TC.getLibraryPaths())
    CmdArgs.push_back(Args.MakeArgString(llvm::Twine("-L", LibPath)));

  const std::string FileName = TC.getCompilerRT(Args, "builtins");
  llvm::SmallString<128> PathBuf{FileName};
  llvm::sys::path::remove_filename(PathBuf);
  CmdArgs.push_back(Args.MakeArgString("-L" + PathBuf));

  CmdArgs.push_back("-o");
  CmdArgs.push_back(Output.getFilename());

  C.addCommand(std::make_unique<Command>(
      JA, *this, ResponseFileSupport::AtFileCurCP(),
      Args.MakeArgString(TC.GetLinkerPath()), CmdArgs, Inputs, Output));
}
