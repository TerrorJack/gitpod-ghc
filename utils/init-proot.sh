#!/usr/bin/env bash

set -euo pipefail

mkdir -p "$XDG_BIN_HOME"
curl -f -L --retry 5 https://proot.gitlab.io/proot/bin/proot -o "$XDG_BIN_HOME/proot"
chmod +x "$XDG_BIN_HOME/proot"
