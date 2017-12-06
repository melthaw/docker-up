#!/bin/bash

set -e

targetPath=${1:-"."}
targetScript=${2:-"run.sh"}

for f in $(find $targetPath -name $targetScript)
do
  if [ -x $f ]
  then
    bash $f
  else
    echo "$f is not executable , skipped"
  fi
done
