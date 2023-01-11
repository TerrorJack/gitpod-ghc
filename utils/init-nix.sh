#!/usr/bin/env bash

set -euo pipefail

mkdir -p "$XDG_CONFIG_HOME/nix"
{
  echo "build-users-group ="
  echo "experimental-features = ca-derivations flakes impure-derivations nix-command"
  echo "max-jobs = auto"
  echo "sandbox = false"
  echo "substituters = https://cache.nixos.org https://cache.iog.io"
  echo "trusted-public-keys = cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY= hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ="
} >> "$XDG_CONFIG_HOME/nix/nix.conf"
curl -f -L --retry 5 https://nixos.org/nix/install | sh -s -- --no-channel-add --no-daemon --no-modify-profile
nix-collect-garbage -d
nix store optimise
