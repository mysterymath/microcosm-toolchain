add_mlir_dialect_library(MLIRArmSVEDialect
  ArmSVEDialect.cpp

  ADDITIONAL_HEADER_DIRS
  ${MLIR_MAIN_INCLUDE_DIR}/mlir/Dialect/ArmSVE

  DEPENDS
  MLIRArmSVEIncGen

  LINK_LIBS PUBLIC
  MLIRIR
  MLIRLLVMDialect
  MLIRVectorDialect
  MLIRSideEffectInterfaces
  )
