#!/usr/bin/env bash

set -euo pipefail

ver=$(curl -f -L --retry 5 https://api.github.com/repos/rui314/mold/releases/latest | jq -r .tag_name | sed 's/v//')
readonly ver

mkdir -p ~/.local

curl -f -L --retry 5 "https://github.com/rui314/mold/releases/download/v$ver/mold-$ver-x86_64-linux.tar.gz" | tar xz --strip-components=1 -C ~/.local
