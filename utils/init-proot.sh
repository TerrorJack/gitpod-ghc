#!/usr/bin/env bash

set -euo pipefail

mkdir -p ~/.local/bin
curl -f -L --retry 5 https://proot.gitlab.io/proot/bin/proot -o ~/.local/bin/proot
chmod +x ~/.local/bin/proot
