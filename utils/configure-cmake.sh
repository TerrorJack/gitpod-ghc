#!/bin/sh

exec cmake \
  -Bbuild \
  -DCMAKE_BUILD_TYPE=MinSizeRel \
  -DCMAKE_C_COMPILER=clang-14 \
  -DCMAKE_CXX_COMPILER=clang++-14 \
  -DCMAKE_C_COMPILER_LAUNCHER=ccache \
  -DCMAKE_CXX_COMPILER_LAUNCHER=ccache \
  -DCMAKE_EXE_LINKER_FLAGS="-fuse-ld=mold" \
  -DCMAKE_MODULE_LINKER_FLAGS="-fuse-ld=mold" \
  -DCMAKE_SHARED_LINKER_FLAGS="-fuse-ld=mold" \
  -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
  -DCMAKE_INSTALL_PREFIX="$HOME/.local" \
  -G Ninja
