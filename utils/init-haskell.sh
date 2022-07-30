#!/usr/bin/env bash

set -euo pipefail

mkdir -p ~/.ghcup/bin
curl -L https://downloads.haskell.org/~ghcup/x86_64-linux-ghcup -o ~/.ghcup/bin/ghcup
chmod +x ~/.ghcup/bin/ghcup

ghcup install ghc 9.2.4 -u https://downloads.haskell.org/~ghc/9.2.4/ghc-9.2.4-x86_64-fedora27-linux.tar.xz
ghcup set ghc 9.2.4
ghcup install cabal

cabal update

sed -i \
  -e 's/-- executable-dynamic: False/executable-dynamic: True/' \
  -e 's/-- minimize-conflict-set: False/minimize-conflict-set: True/' \
  -e 's/-- overwrite-policy:/overwrite-policy: always/' \
  -e 's/-- ghc-options:/ghc-options: -j/' \
  ~/.cabal/config
