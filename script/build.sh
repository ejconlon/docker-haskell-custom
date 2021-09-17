#!/bin/bash

set -eux

GHC="$1"
shift

NAMESPACE="${NAMESPACE:-ejconlon}"
CABAL_INSTALL="3.6.0.0"
STACK="2.7.3"
TAG="${NAMESPACE}/haskell-custom:${GHC}-${ARCH}"

if [ "${ARCH}" != "aarch64" ] && [ "${ARCH}" != "x86_64" ]; then
  echo "Need ARCH (aarch64/x86_64)"
  exit 1
fi

pushd "images/common"
  docker build -t ${TAG} --build-arg ARCH=${ARCH} --build-arg GHC=${GHC} --build-arg CABAL_INSTALL=${CABAL_INSTALL} --build-arg STACK=${STACK} .
popd
