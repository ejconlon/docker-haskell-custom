#!/bin/bash

set -eux

GHC="$1"
shift

NAMESPACE="${NAMESPACE:-ejconlon}"

docker push ${NAMESPACE}/haskell-custom:${GHC}-${ARCH}

# See default tag logic in build.sh
if [ "${ARCH}" == "x86_64" ]; then
  docker push ${NAMESPACE}/haskell-custom:${GHC}
fi
