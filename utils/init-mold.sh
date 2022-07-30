#!/usr/bin/env bash

set -euo pipefail

curl -L https://github.com/rui314/mold/releases/download/v1.3.1/mold-1.3.1-x86_64-linux.tar.gz | tar xz --strip-components=1 -C ~/.local
