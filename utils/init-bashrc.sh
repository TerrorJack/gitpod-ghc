#!/usr/bin/env bash

set -euo pipefail

echo 'touch /tmp/.bashrc' >> ~/.bashrc
echo 'source /tmp/.bashrc' >> ~/.bashrc
echo 'eval "$(direnv hook bash)"' >> ~/.bashrc
