#!/usr/bin/env bash

set -euo pipefail

git clone --recurse-submodules https://gitlab.haskell.org/ghc/ghc.git /workspace/ghc

pushd /workspace/ghc

cp -a /workspace/gitpod-ghc/.vscode .
./boot --hadrian

popd
