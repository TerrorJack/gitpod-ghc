#!/usr/bin/env bash

set -euo pipefail

pushd "$(mktemp -d)"

curl -f -L --retry 5 https://raw.githubusercontent.com/stefan-hoeck/idris2-pack/main/install.bash -O
chmod +x install.bash
echo "chezscheme" | ./install.bash

popd
