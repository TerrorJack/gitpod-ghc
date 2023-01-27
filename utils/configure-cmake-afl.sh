#!/bin/sh

exec cmake \
  -Bbuild \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DCMAKE_C_COMPILER=afl-clang-lto \
  -DCMAKE_CXX_COMPILER=afl-clang-lto++ \
  -DCMAKE_C_COMPILER_LAUNCHER=ccache \
  -DCMAKE_CXX_COMPILER_LAUNCHER=ccache \
  -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
  -DCMAKE_INSTALL_PREFIX=/workspace/.local \
  -G Ninja
