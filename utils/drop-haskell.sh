#!/bin/sh

exec rm -rf \
  /workspace/ghc \
  ~/.cabal/* \
  ~/.cache/ghcide \
  ~/.cache/hie-bios \
  ~/.ghcup/*
