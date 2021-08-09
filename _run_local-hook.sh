#!/bin/bash

GIT_ROOT=`git rev-parse --show-superproject-working-tree --show-toplevel | head -1`
HOOK_NAME=`basename $0`
LOCAL_HOOK="${GIT_ROOT}/.git/hooks/${HOOK_NAME}"

if [ -e $LOCAL_HOOK ]; then
  source $LOCAL_HOOK
fi

echo "Hello!!"