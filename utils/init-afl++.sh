#!/usr/bin/env bash

set -euo pipefail

pushd "$(mktemp -d)"

curl -f -L --retry 5 https://github.com/AFLplusplus/AFLplusplus/archive/refs/heads/stable.tar.gz | tar xz --strip-components=1

make install -j"$(nproc)" LLVM_CONFIG=llvm-config-15 PREFIX="$HOME/.local"

popd
