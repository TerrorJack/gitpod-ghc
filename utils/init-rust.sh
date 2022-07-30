#!/usr/bin/env bash

set -euo pipefail

curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain none --no-modify-path

cp -a /workspace/gitpod-ghc/.cargo/. ~/.cargo
