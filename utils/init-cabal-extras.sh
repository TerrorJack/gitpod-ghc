#!/usr/bin/env bash

set -euo pipefail

pushd "$(mktemp -d)"

curl -L https://github.com/phadej/cabal-extras/archive/refs/heads/master.tar.gz | tar xz --strip-components=1

sed -i \
  -e 's/with-compiler: ghc-8.10.7//' \
  -e 's/  ghc-options: -fwrite-ide-info//' \
  cabal.project

echo "allow-newer: all:base, all:bytestring, all:ghc-prim, all:template-haskell, all:time" > cabal.project.local

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
