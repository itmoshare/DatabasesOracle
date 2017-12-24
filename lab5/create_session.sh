#!/bin/sh
[ -z "$1" ] && exit 1
NAME="$1"

echo "connect $NAME"$'\n' | sqlplusdb