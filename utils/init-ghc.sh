#!/usr/bin/env bash

set -euo pipefail

git clone --recurse-submodules --jobs=8 https://gitlab.haskell.org/ghc/ghc.git /workspace/ghc

pushd /workspace/ghc

git remote add typedance https://gitlab.haskell.org/type-dance/ghc.git

while ! git fetch --all --recurse-submodules --jobs=8
do
  true
done

cp -a /workspace/gitpod-ghc/.vscode .

./boot

popd
