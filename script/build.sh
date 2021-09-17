#!/bin/bash

set -eux

GHC="$1"
shift

NAMESPACE="${NAMESPACE:-ejconlon}"
CABAL_INSTALL="3.6.0.0"
STACK="2.7.3"
SHORT_TAG="${NAMESPACE}/haskell-custom:${GHC}"
LONG_TAG="${SHORT_TAG}-${ARCH}"

if [ "${ARCH}" != "aarch64" ] && [ "${ARCH}" != "x86_64" ]; then
  echo "Need ARCH (aarch64/x86_64)"
  exit 1
fi

pushd "images/common"
  docker build -t ${LONG_TAG} --build-arg ARCH=${ARCH} --build-arg GHC=${GHC} --build-arg CABAL_INSTALL=${CABAL_INSTALL} --build-arg STACK=${STACK} .
popd

# Default to x86_64 if arch is omitted from tag
if [ "${ARCH}" == "x86_64" ]; then
  docker tag ${LONG_TAG} ${SHORT_TAG}
fi
