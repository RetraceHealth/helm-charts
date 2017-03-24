#!/bin/sh

NAME=$1
VERS=$2

sed -i "s/^\($NAME.*\)\"\(.*\"\)/\1\"$VERS\"/" values.yaml
