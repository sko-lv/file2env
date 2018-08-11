#!/bin/bash
set +x
###################################
## Read lines from properties file 
#  and export them into env vars
#
#~  ~ 
#  Usage: $0 [./vars-file.txt]
#~ ~~

VARSFILE=${PWD}/vars-file.txt

export_lines() {
    #echo ==$1
    while IFS='' read -r line || [[ -n "$line" ]]; do
        [ ! -z "$(echo "$line"|grep -Ev '^#' 2>/dev/null)" ] && export $line
    done < "$1"
}

## Main 
if ( [ ! -f "$VARSFILE" ] && [ ! -f "$1" ] ) ; then
     cat $0 | sed -n '/^#~  ~/,/^#~ ~~/p;/^#~  ~~/q'
  else
     [ -s "$VARSFILE" ] && export_lines "$VARSFILE"
     [ -s "$1" ] && export_lines "$1"
 
fi
env |grep '^VAR'
