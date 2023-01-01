#!/usr/bin/env bash

set -euo pipefail

mkdir -p ~/.local/bin

pushd "$(mktemp -d)"

curl -f -L --retry 5 https://github.com/wasm3/wasm3/archive/refs/heads/main.tar.gz | tar xz --strip-components=1

cmake \
  -Bbuild \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_C_COMPILER=clang \
  -DCMAKE_CXX_COMPILER=clang++ \
  -DCMAKE_C_COMPILER_LAUNCHER=ccache \
  -DCMAKE_CXX_COMPILER_LAUNCHER=ccache \
  -DCMAKE_C_FLAGS="-flto=thin -fsplit-lto-unit" \
  -DCMAKE_CXX_FLAGS="-flto=thin -fsplit-lto-unit" \
  -DCMAKE_EXE_LINKER_FLAGS="-fuse-ld=mold" \
  -DCMAKE_MODULE_LINKER_FLAGS="-fuse-ld=mold" \
  -DCMAKE_SHARED_LINKER_FLAGS="-fuse-ld=mold" \
  -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
  -G Ninja

cmake --build build

cp build/wasm3 ~/.local/bin

popd
