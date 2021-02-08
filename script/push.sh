#!/bin/bash

set -eux

GHC="$1"
shift

cat ~/.dockerhub | docker login --username=ejconlon --password-stdin
docker push ejconlon/haskell-custom:${GHC}
