#!/bin/bash

set -euxo pipefail

source ./env

mkdir -p dist
dist=$(pwd)/dist

mkdir -p build
build=$(pwd)/build

pushd "${build}"
pushd "diffutils-${version}"
./configure --enable-static --prefix="${dist}"
make
make install
popd
popd
