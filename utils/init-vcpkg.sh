#!/usr/bin/env bash

set -euo pipefail

mkdir -p "$VCPKG_ROOT"

git clone --single-branch https://github.com/microsoft/vcpkg.git "$VCPKG_ROOT"

pushd "$VCPKG_ROOT"

./bootstrap-vcpkg.sh

ln -sf "$VCPKG_ROOT/scripts/vcpkg_completion.bash" /workspace/.bashrc.d/03-vcpkg

popd
