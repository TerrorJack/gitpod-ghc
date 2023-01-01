#!/usr/bin/env bash

set -euo pipefail

curl -f -L --retry 5 https://deno.land/x/install/install.sh | sh
