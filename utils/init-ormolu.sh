#!/usr/bin/env bash

set -euo pipefail

pushd "$(mktemp -d)"

cabal install \
  cabal-fmt \
  fourmolu \
  ormolu

cabal install \
  --constraint="stylish-haskell +ghc-lib" \
  --constraint="Cabal ==3.6.3.0" \
  --allow-newer="all:base,all:bytestring,all:ghc-prim,all:template-haskell,all:text" \
  stylish-haskell

sed -i \
  -e 's/-haddock -j/-haddock/' \
  ~/.cabal/config

cabal install \
  --with-compiler=ghc-9.0 \
  brittany

sed -i \
  -e 's/-haddock/-haddock -j/' \
  ~/.cabal/config

popd
