#!/bin/bash

set -eux

GHC="$1"
shift

NAMESPACE="${NAMESPACE:-ejconlon}"

docker push ${NAMESPACE}/haskell-custom:${GHC}-${ARCH}
