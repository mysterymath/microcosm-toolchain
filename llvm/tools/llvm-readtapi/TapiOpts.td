// Include the common option parsing interfaces.
include "llvm/Option/OptParser.td"

class FF<string name, string help>: Flag<["-", "--"], name>, HelpText<help>;
multiclass JS<string name, string help, string var = ""> {
  def NAME #_EQ : Joined<["--"], name #"=">, HelpText<help>, MetaVarName<var>;
  def : Separate<["-", "--"], name>, Alias<!cast<Joined>(NAME #_EQ)>;
}

//
// Top level operations 
//
def action_group : OptionGroup<"action group">;
def compare : FF<"compare", "compare tapi files for library differences">, Group<action_group>;
def merge : FF<"merge", "merge the input files that represent the same library">, Group<action_group>;

//
// General Driver options 
//
def help : FF<"help", "display this help">;
defm output: JS<"o", "write output to <file>","<file>">;
def compact: FF<"compact", "write compact tapi output file">;
defm filetype: JS<"filetype", "specify the output file type (tbd-v3, tbd-v4 or tbd-v5)","<value>">;
