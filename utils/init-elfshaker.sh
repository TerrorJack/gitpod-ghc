#!/usr/bin/env bash

set -euo pipefail

ver=$(curl -f -L --retry 5 https://api.github.com/repos/elfshaker/elfshaker/releases | jq -r .[0].tag_name)
readonly ver

mkdir -p "$XDG_BIN_HOME"

curl -f -L --retry 5 https://github.com/elfshaker/elfshaker/releases/download/"$ver"/elfshaker_"$ver"_x86_64-unknown-linux-musl.tar.gz | tar xz --strip-components=1 -C "$XDG_BIN_HOME" --wildcards '*/elfshaker'
