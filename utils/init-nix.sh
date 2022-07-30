#!/usr/bin/env bash

set -euo pipefail

mkdir -p ~/.config/nix
echo "build-users-group =" > ~/.config/nix/nix.conf
echo "experimental-features = ca-derivations flakes impure-derivations nix-command" >> ~/.config/nix/nix.conf
echo "max-jobs = auto" >> ~/.config/nix/nix.conf
echo "sandbox = false" >> ~/.config/nix/nix.conf
echo "substituters = https://cache.nixos.org https://cache.iog.io" >> ~/.config/nix/nix.conf
echo "trusted-public-keys = cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY= hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ=" >> ~/.config/nix/nix.conf
curl -L https://nixos.org/nix/install | sh -s -- --no-channel-add --no-daemon --no-modify-profile
nix-collect-garbage -d
nix store optimise
