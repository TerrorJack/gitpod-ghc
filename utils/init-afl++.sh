#!/usr/bin/env bash

set -euo pipefail

pushd "$(mktemp -d)"

curl -L https://github.com/AFLplusplus/AFLplusplus/archive/refs/tags/4.01c.tar.gz | tar xz --strip-components=1

make install -j"$(nproc)" PREFIX="$HOME/.local"

popd
