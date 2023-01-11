#!/usr/bin/env bash

set -euo pipefail

pushd "$(mktemp -d)"

cabal install \
  --allow-newer=all:template-haskell \
  dhall \
  dhall-lsp-server

popd
