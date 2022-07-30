#!/usr/bin/env bash

set -euo pipefail

mkdir -p ~/.local/bin
curl -L https://proot.gitlab.io/proot/bin/proot -o ~/.local/bin/proot
chmod +x ~/.local/bin/proot
