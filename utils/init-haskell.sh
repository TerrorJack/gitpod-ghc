#!/usr/bin/env bash

set -euo pipefail

pushd "$(mktemp -d)"

curl -f -L --retry 5 https://get-ghcup.haskell.org | BOOTSTRAP_HASKELL_NONINTERACTIVE=1 BOOTSTRAP_HASKELL_MINIMAL=1 sh

ghcup install cabal 3.9.0.0 -u "https://downloads.haskell.org/cabal/cabal-install-3.9.0.0/cabal-install-3.9-x86_64-linux-alpine.tar.xz"
ghcup set cabal 3.9.0.0

cabal user-config init
sed -i \
  -e "s@$HOME/.local/bin@$XDG_BIN_HOME@" \
  -e 's/-- executable-dynamic: False/executable-dynamic: True/' \
  -e 's/-- minimize-conflict-set: False/minimize-conflict-set: True/' \
  -e 's/-- overwrite-policy:/overwrite-policy: always/' \
  -e 's/-- ghc-options:/ghc-options: -haddock -j/' \
  "$XDG_CONFIG_HOME/cabal/config"

AR=/usr/lib/llvm-15/bin/llvm-ar \
  CC=/usr/lib/llvm-15/bin/clang \
  CONF_CC_OPTS_STAGE2="-Wno-unused-command-line-argument" \
  CONF_CXX_OPTS_STAGE2="-Wno-unused-command-line-argument" \
  CONF_GCC_LINKER_OPTS_STAGE2="--ld-path=$XDG_BIN_HOME/ld.mold" \
  CXX=/usr/lib/llvm-15/bin/clang++ \
  LD=$XDG_BIN_HOME/ld.mold \
  MergeObjsCmd=$XDG_BIN_HOME/ld.mold \
  RANLIB=/usr/lib/llvm-15/bin/llvm-ranlib \
  ghcup install ghc 9.4.4 -u "https://downloads.haskell.org/ghc/9.4.4/ghc-9.4.4-x86_64-fedora33-linux.tar.xz"

sed -i \
  -e 's@"clang"@"/usr/lib/llvm-15/bin/clang"@' \
  -e 's@"llc"@"/usr/lib/llvm-15/bin/llc"@' \
  -e 's@"opt"@"/usr/lib/llvm-15/bin/opt"@' \
  "$(ghc-9.4.4 --print-libdir)/settings"

ghcup set ghc 9.4.4

cabal update

popd
