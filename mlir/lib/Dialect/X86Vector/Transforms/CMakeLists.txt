add_mlir_dialect_library(MLIRX86VectorTransforms
  AVXTranspose.cpp
  LegalizeForLLVMExport.cpp

  DEPENDS
  MLIRX86VectorConversionsIncGen

  LINK_LIBS PUBLIC
  MLIRArithDialect
  MLIRX86VectorDialect
  MLIRIR
  MLIRLLVMCommonConversion
  MLIRLLVMDialect
  MLIRVectorDialect
  MLIRVectorUtils
  )
