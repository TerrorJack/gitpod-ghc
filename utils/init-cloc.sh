#!/usr/bin/env bash

set -euo pipefail

ver=$(curl -f -L --retry 5 https://api.github.com/repos/AlDanial/cloc/releases/latest | jq -r .tag_name | sed 's/v//')
readonly ver

mkdir -p "$XDG_BIN_HOME"

curl -f -L --retry 5 "https://github.com/AlDanial/cloc/releases/download/v$ver/cloc-$ver.tar.gz" | tar xz --strip-components=1 -C "$XDG_BIN_HOME" --wildcards '*/cloc'
