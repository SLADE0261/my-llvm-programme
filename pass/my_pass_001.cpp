#include "llvm/IR/Function.h"
#include "llvm/IR/PassManager.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Plugins/PassPlugin.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

namespace {

struct MyPass001 : llvm::detail::PassInfoMixin<MyPass001>
{
  static bool isRequired()
  {
    return true;
  }

  // The pass prints all the FUNCTIONS, MODULES, AND INSTRUCTIONS
  // PreservedAnalyses run(Module &M, ModuleAnalysisManager &AM)
  // {
  //       int count = 0;
  //       for (auto &F : M.functions())
  //       {
  //           errs() << "FUNCTION: " << F.getName() << "\n\n";
  //           errs() << "FUNCTION BODY:\n";
  //           F.print(errs());
  //           errs() << "\n";
  //           errs() << F << "\n";

  //           for (auto &B : F)
  //           {
  //             errs() << "BASIC BLOCK:";
  //             B.print(errs());
  //             errs() << "\n";

  //             for (auto &I : B)
  //             {
  //               errs() << "INSTRUCTIONS: \n";
  //               I.print(errs());
  //               errs() << "\n\n";
  //             }
  //           }
  //           return PreservedAnalyses::all();
  //       };
  // }

  // Pass to count total instructions
    PreservedAnalyses run(Module &M, ModuleAnalysisManager &AM)
    {
      for (auto &F : M.functions())
      {
          int count = 0;
            errs() << "FUNCTION: " << F.getName() << "\n";
              for (auto &B : F)
              {
                for (auto &I : B)
                {
                  ++count;
                }
              }
              errs() << "TOTAL INSTRUCTIONS: " << count << "\n\n";
        }
        return PreservedAnalyses::all();
    }
};

} // namespace

extern "C" ::llvm::PassPluginLibraryInfo llvmGetPassPluginInfo() {
  return
  {
    LLVM_PLUGIN_API_VERSION,
    "MyPass001",
    LLVM_VERSION_STRING,

    [](PassBuilder &PB)
    {
      PB.registerPipelineParsingCallback(
        [](StringRef Name,
           ModulePassManager &MPM,
           ArrayRef<PassBuilder::PipelineElement>)
        {

          if (Name == "MyPass001")
          {
            MPM.addPass(MyPass001());
            return true;
          }

          return false;
        });
    }
  };
}