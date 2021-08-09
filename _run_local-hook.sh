#!/bin/zsh

GIT_ROOT=`git rev-parse --show-superproject-working-tree --show-toplevel | head -1`
HOOK_NAME=`basename $0`
LOCAL_HOOK="${GIT_ROOT}/.git/hooks/${HOOK_NAME}"
retcode=0

if [ -e $LOCAL_HOOK ]; then
  source $LOCAL_HOOK
fi

# Function
function detect_no-break-space(){
  file_arr=(
    $( find . -type f -exec grep -Iq . {} \; -print | grep -v '.git/' )
  )
  for file in "${file_arr[@]}" ; do
    ret=$(grep -nE '\xa0' "${file}")
    if [ $? -eq 0 ] ; then
      echo "WARN : NBSP Detected -> ${file}"
      echo "------"
      echo ${ret}
      echo "------"
      retcode=255
    fi
  done
}

# Main
detect_no-break-space
[ ${retcode} -eq 0 ] && echo "PROCEED : git commit" || echo "ABORT : git commit"
exit ${retcode}