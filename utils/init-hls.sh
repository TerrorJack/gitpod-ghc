#!/usr/bin/env bash

set -euo pipefail

pushd "$(mktemp -d)"

curl -L https://github.com/haskell/haskell-language-server/archive/refs/heads/master.tar.gz | tar xz --strip-components=1

sed -i 's/  ghc-options: -haddock//' cabal.project
sed -i 's/with-rtsopts=/with-rtsopts=--nonmoving-gc /g' haskell-language-server.cabal

cabal install \
  exe:haskell-language-server \
  apply-refact \
  alex \
  floskell \
  fourmolu \
  ghcid \
  happy \
  hiedb \
  hlint \
  hp2pretty \
  hscolour \
  ormolu \
  pretty-simple \
  retrie \
  stylish-haskell

popd
