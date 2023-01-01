#!/usr/bin/env bash

set -euo pipefail

curl -f -L --retry 5 https://sh.rustup.rs | sh -s -- -y --default-toolchain none --no-modify-path

cp -a /workspace/gitpod-ghc/.cargo/. ~/.cargo
