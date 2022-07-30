#!/usr/bin/env bash

set -euo pipefail

echo 'Host *.gitpod.io' >> ~/.ssh/config
echo '  StrictHostKeyChecking no' >> ~/.ssh/config
ssh-keyscan -H github.com >> ~/.ssh/known_hosts
ssh-keyscan -H gitlab.haskell.org >> ~/.ssh/known_hosts
