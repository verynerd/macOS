#!/bin/bash

SYSVER="10_15_6"

FILENAME=$1
NULLPATH=${FILENAME%/*}
OUTPUTFILE="${NULLPATH}/${SYSVER}_links.txt"
OUTPUTCDNFILE="${NULLPATH}/${SYSVER}_cdn_links.txt"


if [[ -d ~/Downloads/macOS ]]; then

	rm -r ~/Downloads/macOS
	mkdir ~/Downloads/macOS && cd  ~/Downloads/macOS

else
	mkdir ~/Downloads/macOS && cd  ~/Downloads/macOS
fi

URL="https://raw.githubusercontent.com/verynerd/macOS/master/10_15_6_links.txt"
# URL="https://raw.githubusercontent.com/verynerd/macOS/master/10_15_6_cdn_links.txt"


# 下载 plist 文件
wget -q --show-progress --no-check-certificate -O links.txt $URL 

echo "Downloading split files..."
mkdir splits && wget -q --show-progress --no-check-certificate -i links.txt -P splits 

cat splits/10_15_6.dmg* > 10_15_6.dmg 