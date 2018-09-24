#!/bin/bash

set -eux

LLVM_VERSION=6.0
LLVM_REPO='xenial'

echo "deb http://apt.llvm.org/${LLVM_REPO}/ llvm-toolchain-${LLVM_REPO}-${LLVM_VERSION} main" \
    | tee /etc/apt/sources.list.d/llvm.list
echo 'Adding repo for llvm'
curl https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -
echo 'Installing clang'
apt-get update
apt-get -qqy install "clang-${LLVM_VERSION}" "clang-format-${LLVM_VERSION}"

