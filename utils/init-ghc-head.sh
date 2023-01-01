#!/usr/bin/env bash

set -euo pipefail

rm -rf ~/.cabal/store/ghc-9.5*

ghcup rm ghc 9.5 || true

AR=/usr/lib/llvm-15/bin/llvm-ar \
  CC=/usr/lib/llvm-15/bin/clang \
  CONF_CC_OPTS_STAGE2="-Wno-unused-command-line-argument" \
  CONF_CXX_OPTS_STAGE2="-Wno-unused-command-line-argument" \
  CONF_GCC_LINKER_OPTS_STAGE2="--ld-path=/usr/lib/llvm-15/bin/ld.lld" \
  CXX=/usr/lib/llvm-15/bin/clang++ \
  LD=/usr/lib/llvm-15/bin/ld.lld \
  MergeObjsCmd=/usr/lib/llvm-15/bin/ld.lld \
  RANLIB=/usr/lib/llvm-15/bin/llvm-ranlib \
  ghcup install ghc 9.5 -u "https://gitlab.haskell.org/ghc/ghc/-/jobs/artifacts/master/raw/ghc-x86_64-linux-fedora33-release.tar.xz?job=x86_64-linux-fedora33-release"

sed -i \
  -e 's@"clang"@"/usr/lib/llvm-15/bin/clang"@' \
  -e 's@"llc"@"/usr/lib/llvm-15/bin/llc"@' \
  -e 's@"opt"@"/usr/lib/llvm-15/bin/opt"@' \
  "$(ghc-9.5 --print-libdir)/settings"
