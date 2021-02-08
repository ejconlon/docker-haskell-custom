#!/bin/bash

set -eux

GHC="$1"
shift

TAG="ejconlon/haskell-custom:${GHC}"

docker run -it ${TAG} /bin/bash
