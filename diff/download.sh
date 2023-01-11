#!/bin/bash

set -euxo pipefail

source ./env

gz_vers=("2.7" "2.8" "2.8.1")

mkdir -p build

if [[ "${gz_vers[@]}" =~ "${version}" ]]; then
	curl -L https://ftpmirror.gnu.org/diffutils/diffutils-${version}.tar.gz --output source.tar.gz
    srcfile=$(pwd)/source.tar.gz
else 
	curl -L https://ftpmirror.gnu.org/diffutils/diffutils-${version}.tar.xz --output source.tar.xz
    srcfile=$(pwd)/source.tar.xz
fi

pushd build
tar -xvf $srcfile
popd