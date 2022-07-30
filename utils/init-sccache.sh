#!/usr/bin/env bash

set -euo pipefail

curl -L https://github.com/mozilla/sccache/releases/download/v0.3.0/sccache-dist-v0.3.0-x86_64-unknown-linux-musl.tar.gz | tar xz -C ~/.local/bin --strip-components=1 --wildcards '*/sccache-dist'
chmod +x ~/.local/bin/sccache-dist

curl -L https://github.com/mozilla/sccache/releases/download/v0.3.0/sccache-v0.3.0-x86_64-unknown-linux-musl.tar.gz | tar xz -C ~/.local/bin --strip-components=1 --wildcards '*/sccache'
chmod +x ~/.local/bin/sccache
