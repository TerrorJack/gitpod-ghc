#!/bin/sh

exec cmake \
  -Bbuild \
  -Hllvm \
  -DBUILD_SHARED_LIBS=ON \
  -DCMAKE_BUILD_TYPE=MinSizeRel \
  -DCMAKE_C_COMPILER=clang-14 \
  -DCMAKE_CXX_COMPILER=clang++-14 \
  -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
  -DCMAKE_INSTALL_PREFIX="$HOME/.local" \
  -DLLVM_CCACHE_BUILD=ON \
  -DLLVM_ENABLE_IDE=ON \
  -DLLVM_ENABLE_PROJECTS=all \
  -DLLVM_PARALLEL_LINK_JOBS=1 \
  -DLLVM_USE_LINKER=mold \
  -G Ninja
