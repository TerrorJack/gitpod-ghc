#!/usr/bin/env bash

set -euo pipefail

pushd "$(mktemp -d)"

curl -f -L --retry 5 https://github.com/MaskRay/ccls/archive/refs/heads/master.tar.gz | tar xz --strip-components=1

cmake \
  -Bbuild \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_C_COMPILER=clang \
  -DCMAKE_CXX_COMPILER=clang++ \
  -DCMAKE_C_FLAGS="-flto=thin -fsplit-lto-unit" \
  -DCMAKE_CXX_FLAGS="-flto=thin -fsplit-lto-unit" \
  -DCMAKE_EXE_LINKER_FLAGS="-fuse-ld=lld" \
  -DCMAKE_MODULE_LINKER_FLAGS="-fuse-ld=lld" \
  -DCMAKE_SHARED_LINKER_FLAGS="-fuse-ld=lld" \
  -DCMAKE_INSTALL_PREFIX="$HOME/.local" \
  -DCMAKE_PREFIX_PATH=/usr/lib/llvm-15 \
  -G Ninja

cmake --build build --target install

popd
