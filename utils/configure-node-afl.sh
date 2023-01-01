#!/bin/sh

CC="ccache afl-clang-lto" CXX="ccache afl-clang-lto++" exec ./configure --ninja --openssl-no-asm --v8-lite-mode --without-node-code-cache --without-node-snapshot
