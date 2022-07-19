#!/bin/bash

if [ $# -ne 2 ]; then
        echo "Usage: $0 [machine name] [Project name]"
        echo "       "
        exit 1
fi

BRANCH=$(git symbolic-ref --short -q HEAD 2>/dev/null)
echo "BRANCH on $BRANCH"

./scripts/repo init -u https://github.com/SalamFES/sfes-manifest.git -b $BRANCH -m pn_001.xml &&
./scripts/repo sync &&

echo "Start setup-environment"
MACHINE=$1 source scripts/setup-environment ./$2-build

echo "Done."


