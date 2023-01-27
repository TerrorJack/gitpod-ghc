#!/usr/bin/env bash

set -euo pipefail

ver=$(curl -f -L --retry 5 https://api.github.com/repos/Z3Prover/z3/releases/latest | jq -r .tag_name | sed 's/z3-//')
readonly ver

mkdir -p /workspace/.local

pushd "$(mktemp -d)"

curl -f -L --retry 5 "https://github.com/Z3Prover/z3/releases/download/z3-$ver/z3-$ver-x64-glibc-2.31.zip" -O
unzip "z3-$ver-x64-glibc-2.31.zip"
cp -a "z3-$ver-x64-glibc-2.31"/. /workspace/.local

popd
