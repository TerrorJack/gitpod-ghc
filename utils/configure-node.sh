#!/bin/sh

CC="ccache clang-14" CXX="ccache clang++-14" exec ./configure --ninja --openssl-no-asm --without-node-code-cache --without-node-snapshot
