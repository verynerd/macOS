#!/bin/bash

FILENAME=$1
REPOURL="https://raw.githubusercontent.com/verynerd/macOS/master/"
CDNREPO="https://cdn.jsdelivr.net/gh/verynerd/macOS@resources/"

PS3='Enter the numerical number of the option: '
echo "Specify the version of macOS you want."
options=("macOS 10.14.6" "macOS 10.15.6" "macOS 10.15.7" "macOS 10.16 Beta 7" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "macOS 10.14.6")
            SYSVER="10_14_6"
            URL="${REPOURL}${SYSVER}_links.txt"
            break
            ;;
        "macOS 10.15.6")
            SYSVER="10_15_6"
            URL="${REPOURL}${SYSVER}_links.txt"
            break
            ;;
        "macOS 10.15.7")
            SYSVER="10_15_7"
            URL="${REPOURL}${SYSVER}_links.txt"
            break
            ;;
        "macOS 10.16 Beta 7")
            SYSVER="10_16_Beta7"
            URL="${REPOURL}${SYSVER}_links.txt"
            break
            ;;
        "Quit")
            echo ""    
            break
            ;;
        *) echo "Invalied input! Please enter the numerical number of the option";;
    esac
done

PS3='Specify the which download source you want:'
options=("Github" "CDN accelerated" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Github")
            URL="${REPOURL}${SYSVER}_links.txt"
            break
            ;;

        "CDN accelerated")
            URL="${REPOURL}${SYSVER}_cdn_links.txt"
            break
            ;;

        "Quit")
            echo ""    
            break
            ;;
        *) echo "Invalied input";;
    esac
done

# Exit if SYSVER NOT SPECIFIED
if [[ $SYSVER != '' ]]; then

    if [[ -d ~/Downloads/macOS ]]; then

        rm -r ~/Downloads/macOS
        mkdir ~/Downloads/macOS && cd  ~/Downloads/macOS

    else
        mkdir ~/Downloads/macOS && cd  ~/Downloads/macOS
    fi

    # 下载 plist 文件
    wget -q --show-progress --no-check-certificate -O links.txt $URL 

    echo "Downloading split files..."
    mkdir splits && wget -q --show-progress --no-check-certificate -i links.txt -P splits 

    cat splits/${SYSVER}.dmg* > ${SYSVER}.dmg 
    rm -R splits    
fi
