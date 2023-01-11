#!/usr/bin/env bash

set -euo pipefail

pushd "$(mktemp -d)"

curl -f -L --retry 5 https://github.com/haskell/haskell-language-server/archive/refs/heads/master.tar.gz | tar xz --strip-components=1

sed -i \
  -e '/tests: true/d' \
  -e '/ghc-options: -haddock/d' \
  -e '/index-state:/d' \
  -e '/hlint +ghc-lib/d' \
  cabal.project
echo "allow-newer: all:base, all:ghc-prim, all:template-haskell, all:text, all:time" >> cabal.project.local
sed -i 's/with-rtsopts=/with-rtsopts=--nonmoving-gc /g' haskell-language-server.cabal

cabal install \
  exe:haskell-language-server \
  aeson-pretty \
  alex \
  bench \
  cabal-fmt \
  eventlog2html \
  floskell \
  fourmolu \
  ghcid \
  happy \
  hiedb \
  hindent \
  hlint \
  hoogle \
  hp2pretty \
  hscolour \
  ormolu \
  pretty-simple \
  stylish-haskell

popd
