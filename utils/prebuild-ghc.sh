#!/usr/bin/env bash

set -euo pipefail

pushd /workspace/ghc

./configure

hadrian/build --build-root=.hie-bios --flavour=ghc-in-ghci --docs=none -j tool:ghc/Main.hs

haskell-language-server typecheck \
  ghc/Main.hs \
  hadrian/src/Main.hs

popd
