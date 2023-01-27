#!/usr/bin/env bash

set -euo pipefail

ver=$(curl -f -L --retry 5 https://api.github.com/repos/Wilfred/difftastic/releases/latest | jq -r .tag_name)
readonly ver

mkdir -p "$XDG_BIN_HOME"

curl -f -L --retry 5 "https://github.com/Wilfred/difftastic/releases/download/$ver/difft-x86_64-unknown-linux-gnu.tar.gz" | tar xz -C "$XDG_BIN_HOME"

git config --global diff.external difft || true
