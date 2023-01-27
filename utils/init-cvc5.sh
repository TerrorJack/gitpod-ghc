#!/usr/bin/env bash

set -euo pipefail

ver=$(curl -f -L --retry 5 https://api.github.com/repos/cvc5/cvc5/releases/latest | jq -r .tag_name)
readonly ver

mkdir -p "$XDG_BIN_HOME"

curl -f -L --retry 5 "https://github.com/cvc5/cvc5/releases/download/$ver/cvc5-Linux" -o "$XDG_BIN_HOME/cvc5"

chmod +x "$XDG_BIN_HOME/cvc5"
