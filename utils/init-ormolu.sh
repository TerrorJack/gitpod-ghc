#!/usr/bin/env bash

set -euo pipefail

pushd "$(mktemp -d)"

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
