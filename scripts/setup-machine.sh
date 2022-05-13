#!/bin/bash

if [ $# -ne 1 ]; then
        echo "Usage: $0 [machine-name]"
        echo "       "
        exit 1
fi

./scripts/repo init -u https://gitlab.com/ahmadBM/ebs-manifest -b master -m ebscore/default.xml &&
./scripts/repo sync &&

MACHINE=$1 source setup-environment ./$1-build
