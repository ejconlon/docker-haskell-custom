#!/bin/bash

set -eux

GHC="$1"
shift

TAG="haskell-custom:${GHC}"

docker run -it ${TAG}
