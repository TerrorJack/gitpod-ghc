#!/usr/bin/env bash

set -euo pipefail

ver=$(curl -f -L --retry 5 https://api.github.com/repos/mozilla/sccache/releases/latest | jq -r .tag_name)
readonly ver

mkdir -p "$XDG_BIN_HOME"

curl -f -L --retry 5 "https://github.com/mozilla/sccache/releases/download/$ver/sccache-dist-$ver-x86_64-unknown-linux-musl.tar.gz" | tar xz -C "$XDG_BIN_HOME" --strip-components=1 --wildcards "*/sccache-dist"
chmod +x "$XDG_BIN_HOME/sccache-dist"

curl -f -L --retry 5 "https://github.com/mozilla/sccache/releases/download/$ver/sccache-$ver-x86_64-unknown-linux-musl.tar.gz" | tar xz -C "$XDG_BIN_HOME" --strip-components=1 --wildcards "*/sccache"
chmod +x "$XDG_BIN_HOME/sccache"
