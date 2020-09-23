#!/bin/bash

SYSVER=$1
ls ./ > /tmp/files.txt

REPOROOT="https://github.com/verynerd/macOS/tree/resources/"
CDNREPO="https://cdn.jsdelivr.net/gh/verynerd/macOS@resources/"

URLPRE="${REPOROOT}${SYSVER}"
URLPRECDN="${CDNREPO}${SYSVER}"

OUTPUTFILE="/Users/"$(whoami)"/Desktop/${SYSVER}_links.txt"
OUTPUTCDNFILE="/Users/"$(whoami)"/Desktop/${SYSVER}_cdn_links.txt"

if [[ -f "$OUTPUTFILE" ]] || [[ -f "$OUTPUTFILE" ]]; then
	rm $OUTPUTFILE
	rm $OUTPUTCDNFILE
fi

while read LINE; 
do
# reading each line
  echo "${URLPRE}/${LINE}" >> ${OUTPUTFILE}
  echo "${URLPRECDN}/${LINE}" >> ${OUTPUTCDNFILE}
  
done < /tmp/files.txt