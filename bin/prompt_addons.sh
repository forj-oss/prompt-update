#!/bin/bash
#
#

INFO=""

if [[ $# -gt 2 ]]
then
   COLOR=$3
   NORMAL_COLOR=$4
   if [[ "$COLOR" = "" ]] || [[ "$NORMAL_COLOR" = "" ]] 
   then
      COLOR=""
      NORMAL_COLOR=""
   fi
fi

if [[ "$PROMPT_HANDLER_ADDONS" != "" ]]
then
    $PROMPT_HANDLER_ADDONS
fi

for i in $(set | grep -e "^PROMPT_ADDONS\w*=" | sed 's/^\(\w*\)=.*$/\1/g')
do
  eval "VAL=\"$COLOR\$$i$NORMAL_COLOR\""
  if [ "$INFO" = "" ]
  then
     INFO="$(echo "$VAL" | tail -n 1)"
  else
     INFO="${INFO} | $(echo "$VAL" | tail -n 1)"
  fi
done
if [ "$INFO" != "" ]
then
   echo $1$INFO$2
fi
