#!/usr/bin/env bash

set -euo pipefail

rm a.out || true

hadrian/build --build-root=.hie-bios --flavour=ghc-in-ghci --docs=none -j tool:ghc/Main.hs

haskell-language-server typecheck \
  ghc/Main.hs \
  hadrian/src/Main.hs \
  libraries/ghc-heap/GHC/Exts/Heap.hs \
  utils/deriveConstants/Main.hs
