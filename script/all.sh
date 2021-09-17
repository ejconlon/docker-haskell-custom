#!/bin/bash

set -eux

VERSIONS="8.10.7 9.0.1"

for VERSION in ${VERSIONS}
do
  ./script/build.sh ${VERSION}
done

./script/login.sh

for VERSION in ${VERSIONS}
do
  ./script/push.sh ${VERSION}
done