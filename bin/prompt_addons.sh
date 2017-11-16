#!/bin/bash
#
#

INFO=""

for i in $(set | grep -e "^PROMPT_ADDONS\w*=" | sed 's/^\(\w*\)=.*$/\1/g')
do
  eval "VAL=\"\$$i\""
  if [ "$INFO" = "" ]
  then
     INFO="$(echo $VAL | tail -n 1)"
  else
     INFO="${INFO}-$(echo $VAL | tail -n 1)"
  fi
done
if [ "$INFO" != "" ]
then
   echo $1$INFO$2
fi
