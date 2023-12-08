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

  AddLinkerInputs(TC, Inputs, Args, CmdArgs, JA);

  Args.addAllArgs(CmdArgs, {options::OPT_L, options::OPT_T_Group,
                            options::OPT_s, options::OPT_t, options::OPT_r});

  TC.AddFilePathLibArgs(Args, CmdArgs);

  const std::string FileName = TC.getCompilerRT(Args, "builtins");
  llvm::SmallString<128> PathBuf{FileName};
  llvm::sys::path::remove_filename(PathBuf);
  CmdArgs.push_back(Args.MakeArgString("-L" + PathBuf));

  if (Args.hasArg(options::OPT_shared))
    CmdArgs.push_back("-shared");
  else
    CmdArgs.push_back("-pie");

  CmdArgs.push_back("-z");
  CmdArgs.push_back("norelro");
  CmdArgs.push_back("-z");
  CmdArgs.push_back("max-page-size=1");

  CmdArgs.push_back("-fdpic");
  // 32-bit ARM is deprecated, and 64-bit ARM has an MMU.
  CmdArgs.push_back("-thumb-plt");

  CmdArgs.push_back("--hash-style=gnu");

  CmdArgs.push_back("-o");
  CmdArgs.push_back(Output.getFilename());

  C.addCommand(std::make_unique<Command>(
      JA, *this, ResponseFileSupport::AtFileCurCP(),
      Args.MakeArgString(TC.GetLinkerPath()), CmdArgs, Inputs, Output));
}
