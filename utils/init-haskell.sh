#!/usr/bin/env bash

set -euo pipefail

pushd "$(mktemp -d)"

mkdir -p ~/.ghcup/bin
curl -f -L --retry 5 "https://downloads.haskell.org/ghcup/x86_64-linux-ghcup" -o ~/.ghcup/bin/ghcup
chmod +x ~/.ghcup/bin/ghcup

ghcup install cabal 3.8.1.0 -u "https://downloads.haskell.org/cabal/cabal-install-3.8.1.0/cabal-install-3.8.1.0-x86_64-linux-deb10.tar.xz"
ghcup set cabal 3.8.1.0

cabal user-config init
sed -i \
  -e 's/-- executable-dynamic: False/executable-dynamic: True/' \
  -e 's/-- minimize-conflict-set: False/minimize-conflict-set: True/' \
  -e 's/-- overwrite-policy:/overwrite-policy: always/' \
  -e 's/-- ghc-options:/ghc-options: -haddock -j/' \
  ~/.cabal/config

AR=/usr/lib/llvm-15/bin/llvm-ar \
  CC=/usr/lib/llvm-15/bin/clang \
  CONF_CC_OPTS_STAGE2="-Wno-unused-command-line-argument" \
  CONF_CXX_OPTS_STAGE2="-Wno-unused-command-line-argument" \
  CONF_GCC_LINKER_OPTS_STAGE2="--ld-path=$HOME/.local/bin/ld.mold" \
  CXX=/usr/lib/llvm-15/bin/clang++ \
  LD=$HOME/.local/bin/ld.mold \
  MergeObjsCmd=$HOME/.local/bin/ld.mold \
  RANLIB=/usr/lib/llvm-15/bin/llvm-ranlib \
  ghcup install ghc 9.4.4 -u "https://downloads.haskell.org/ghc/9.4.4/ghc-9.4.4-x86_64-fedora33-linux.tar.xz"

sed -i \
  -e 's@"clang"@"/usr/lib/llvm-15/bin/clang"@' \
  -e 's@"llc"@"/usr/lib/llvm-15/bin/llc"@' \
  -e 's@"opt"@"/usr/lib/llvm-15/bin/opt"@' \
  "$(ghc-9.4.4 --print-libdir)/settings"

ghcup set ghc 9.4.4

cabal update

rm -rf \
  ~/.ghcup/cache \
  ~/.ghcup/logs \
  ~/.ghcup/tmp \
  ~/.ghcup/trash

popd
