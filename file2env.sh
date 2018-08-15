#!/bin/bash
set +x
###################################
## Read lines from properties file 
#  and export them into env vars
###################################

#~  ~ 
#
# Usage: file2env.sh [./vars-file.txt]
#
#  == Format of vars-file.txt ==
#  .....
#  #This is comment line
#  VAR1=varstring1
#  VAR2=varstring2
#  #Next line is to unset VAR
#  -n VAR3
#  .....
#
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
     echo ERROR: no VARSFILE found! Exitting ...
     cat $0| sed -n '/^#~  ~/,/^#~ ~~/p;/^#~  ~~/q'| sed 's/^#//'| grep -v '^~'
  else
     [ -s "$VARSFILE" ] && export_lines "$VARSFILE"
     [ ! -f "$1" ] && echo WARNING: no such file $1. Exporting from default file.
     [ -s "$1" ] && export_lines "$1"
 
fi

