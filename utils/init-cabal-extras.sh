#!/usr/bin/env bash

set -euo pipefail

pushd "$(mktemp -d)"

curl -f -L --retry 5 https://github.com/phadej/cabal-extras/archive/refs/heads/master.tar.gz | tar xz --strip-components=1

sed -i \
  -e '/with-compiler: ghc-8.10.7/d' \
  -e '/ghc-options: -fwrite-ide-info/d' \
  cabal.project

echo "allow-newer: all:base, all:bytestring, all:ghc-prim, all:template-haskell, all:time" >> cabal.project.local

cabal install \
  cabal-bundler \
  cabal-deps \
  cabal-diff \
  cabal-docspec \
  cabal-env \
  cabal-hie \
  cabal-store-check \
  cabal-store-gc

popd
