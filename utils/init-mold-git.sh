#!/usr/bin/env bash

set -euo pipefail

pushd "$(mktemp -d)"

git clone --depth=1 https://github.com/rui314/mold.git .

cmake \
  -Bbuild \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_C_COMPILER=clang \
  -DCMAKE_CXX_COMPILER=clang++ \
  -DCMAKE_C_COMPILER_LAUNCHER=ccache \
  -DCMAKE_CXX_COMPILER_LAUNCHER=ccache \
  -DCMAKE_C_FLAGS="-flto=thin -fsplit-lto-unit" \
  -DCMAKE_CXX_FLAGS="-flto=thin -fsplit-lto-unit" \
  -DCMAKE_EXE_LINKER_FLAGS="-fuse-ld=lld -s" \
  -DCMAKE_MODULE_LINKER_FLAGS="-fuse-ld=lld -s" \
  -DCMAKE_SHARED_LINKER_FLAGS="-fuse-ld=lld -s" \
  -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
  -DCMAKE_INSTALL_PREFIX=/workspace/.local \
  -G Ninja

cmake --build build
cmake --install build

popd
