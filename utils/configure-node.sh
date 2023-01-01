#!/bin/sh

CC="ccache clang" CXX="ccache clang++" exec ./configure --enable-static --ninja --openssl-no-asm --without-node-code-cache --without-node-snapshot
