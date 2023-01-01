#!/usr/bin/env bash

set -euo pipefail

curl -f -L --retry 5 https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh | sh -s -- -y --default-toolchain none --no-modify-path
