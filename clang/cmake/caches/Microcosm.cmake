set(LLVM_ENABLE_PROJECTS clang lld CACHE STRING "")
set(LLVM_TARGETS_TO_BUILD ARM CACHE STRING "")
set(LLVM_ENABLE_LIBXML2 OFF CACHE STRING "")
set(LLVM_ENABLE_ZLIB OFF CACHE STRING "")
set(LLVM_ENABLE_ZSTD OFF CACHE STRING "")

set(LLVM_ENABLE_RUNTIMES compiler-rt CACHE STRING "")
set(LLVM_BUILTIN_TARGETS armv6m-none-microcosm CACHE STRING "")
set(LLVM_RUNTIME_TARGETS "" CACHE STRING "")

set(LLVM_DEFAULT_TARGET_TRIPLE armv6m-none-microcosm CACHE STRING "")

set(BUILTINS_armv6m-none-microcosm_CMAKE_BUILD_TYPE MinSizeRel CACHE STRING "")
set(BUILTINS_armv6m-none-microcosm_CMAKE_SYSTEM_NAME Microcosm CACHE STRING "")
set(BUILTINS_armv6m-none-microcosm_COMPILER_RT_BAREMETAL_BUILD ON CACHE BOOL "")

set(LLVM_DISTRIBUTION_COMPONENTS
  builtins
  clang
  lld
  llvm-addr2line
  llvm-ar
  llvm-cxxfilt
  llvm-dwarfdump
  llvm-mc
  llvm-nm
  llvm-objcopy
  llvm-objdump
  llvm-ranlib
  llvm-readelf
  llvm-readobj
  llvm-size
  llvm-strings
  llvm-strip
  llvm-symbolizer
  CACHE STRING "")
