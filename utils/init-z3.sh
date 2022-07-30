#!/usr/bin/env bash

set -euo pipefail

pushd "$(mktemp -d)"

curl -L https://github.com/Z3Prover/z3/releases/download/z3-4.10.1/z3-4.10.1-x64-glibc-2.31.zip -O
unzip z3-4.10.1-x64-glibc-2.31.zip
cp -a z3-4.10.1-x64-glibc-2.31/. ~/.local

popd
