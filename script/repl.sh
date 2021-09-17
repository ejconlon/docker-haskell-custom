#!/bin/bash

set -eux

GHC="$1"
shift

NAMESPACE="${NAMESPACE:-ejconlon}"
TAG="${NAMESPACE}/haskell-custom:${GHC}-${ARCH}"

docker run -it ${TAG} /bin/bash
