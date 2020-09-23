#!/bin/bash

SYSVER="10_15_6"

FILENAME=$1
NULLPATH=${FILENAME%/*}
OUTPUTFILE="${NULLPATH}/${SYSVER}_links.txt"
OUTPUTCDNFILE="${NULLPATH}/${SYSVER}_cdn_links.txt"

REPOROOT="https://raw.githubusercontent.com/verynerd/macOS/resources/"
CDNREPO="https://cdn.jsdelivr.net/gh/verynerd/macOS@resources/"

URLPRE="${REPOROOT}${SYSVER}"
URLPRECDN="${CDNREPO}${SYSVER}"


if [[ -f "$OUTPUTFILE" ]] || [[ -f "$OUTPUTFILE" ]]; then
	rm $OUTPUTFILE
	rm $OUTPUTCDNFILE
fi
while read LINE; 
do
# reading each line
  echo "${URLPRE}/${LINE}" >> $OUTPUTFILE
  echo "${URLPRECDN}/${LINE}" >> $OUTPUTCDNFILE  
done < $FILENAME	