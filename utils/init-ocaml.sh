#!/usr/bin/env bash

set -euo pipefail

ver=$(curl -f -L --retry 5 https://api.github.com/repos/ocaml/opam/releases/latest | jq -r .tag_name)
readonly ver

mkdir -p ~/.local/bin

pushd "$(mktemp -d)"

curl -f -L --retry 5 "https://github.com/ocaml/opam/releases/download/$ver/opam-$ver-x86_64-linux" -o ~/.local/bin/opam

chmod +x ~/.local/bin/opam

CC=clang CXX=clang++ opam init --disable-sandboxing --no

opam install -y \
  dune \
  ocaml-lsp-server

popd
