#!/bin/bash

set -eux

GHC="$1"
shift

NAMESPACE="${NAMESPACE:-ejconlon}"
CABAL_INSTALL="3.2.0.0"
TAG="${NAMESPACE}/haskell-custom:${GHC}"

pushd "images/common"
  docker build -t ${TAG} --build-arg GHC=${GHC} --build-arg CABAL_INSTALL=${CABAL_INSTALL} .
popd
