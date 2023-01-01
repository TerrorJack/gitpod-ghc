#!/bin/sh

exec cmake \
  -Bbuild \
  -DWASI_SDK_PREFIX=/workspace/.ghc-wasm/wasi-sdk \
  -DCMAKE_TOOLCHAIN_FILE=/workspace/.ghc-wasm/wasi-sdk/share/cmake/wasi-sdk.cmake \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_C_COMPILER_LAUNCHER=ccache \
  -DCMAKE_CXX_COMPILER_LAUNCHER=ccache \
  -DCMAKE_C_FLAGS="-flto=thin -fsplit-lto-unit" \
  -DCMAKE_CXX_FLAGS="-flto=thin -fsplit-lto-unit" \
  -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
  -G Ninja \
  ${1+"$@"}
