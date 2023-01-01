#!/usr/bin/env bash

set -euo pipefail

ver=$(curl -f -L --retry 5 https://api.github.com/repos/cvc5/cvc5/releases/latest | jq -r .tag_name)
readonly ver

mkdir -p ~/.local/bin

curl -f -L --retry 5 "https://github.com/cvc5/cvc5/releases/download/$ver/cvc5-Linux" -o ~/.local/bin/cvc5

chmod +x ~/.local/bin/cvc5
