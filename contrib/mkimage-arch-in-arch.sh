#!/bin/bash

set -e

IMAGE="$1"
WORKDIR="$2"
NAME="${3:-archlinux}"

dir=$(dirname $(readlink -f $0))

cp "$dir/mkimage-arch.sh" "$WORKDIR/mkimage-arch.sh"

docker run -v="$WORKDIR:/workdir" "$IMAGE" bash /workdir/mkimage-arch.sh /workdir "$NAME" -no-import
