#!/usr/bin/env bash

set -euo pipefail

curl -L https://get-ghcup.haskell.org | BOOTSTRAP_HASKELL_NONINTERACTIVE=1 BOOTSTRAP_HASKELL_GHC_VERSION=9.2.3 AR=llvm-ar-14 CC=clang-14 LD=ld.lld-14 RANLIB=llvm-ranlib-14 sh

sed -i \
  -e 's/"--target=x86_64-unknown-linux  "/"--target=x86_64-unknown-linux -fuse-ld=lld-14"/' \
  -e 's/-no-pie", "NO"/-no-pie", "YES"/' \
  "$(ghc --print-libdir)/settings"

rm -rf ~/.ghcup/cache

sed -i \
  -e 's/-- executable-dynamic: False/executable-dynamic: True/' \
  -e 's/-- minimize-conflict-set: False/minimize-conflict-set: True/' \
  -e 's/-- overwrite-policy:/overwrite-policy: always/' \
  -e 's/-- ghc-options:/ghc-options: -j/' \
  ~/.cabal/config
