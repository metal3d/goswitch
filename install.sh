#!/bin/bash

LOCATION=""
select_path(){
    local OLDIFS=$IFS
    local IFS=":"
    location=""

    P=()
    for p in ${PATH[*]}; do
        P+=( "$p" )
    done

    P=$(local IFS=$'\n'; sort -u <<<"${P[*]}" | uniq)
    IFS=$OLDIFS

    echo "Select a directory that is in your PATH."
    echo "Prefer $HOME/.local/bin or $HOME/bin to not use system directory" 
    select place in "Cancel" ${P} ; do
        if [ "$place" == "Cancel" ]; then
            exit 0
        fi
        location=$place
        if [ "$location" == "" ]; then
            echo "Please select a valid option"
            continue
        fi
        break
    done
    LOCATION="$location"
}

check_requirements(){
    which curl 2>&1 >/dev/null
    if [ $? != "0" ]; then
        echo "You need curl to complete instalation, try one of that commands:"
        echo "pkcon install curl"
        echo "dnf install curl"
        echo "apt install curl"
        exit 1
    fi
}

check_requirements
select_path
echo "Installing in $LOCATION"
curl -sSL \
    $(curl -s https://api.github.com/repos/metal3d/goswitch/releases/latest | grep tarball | cut -d '"' -f 4) | \
    tar -zxf - --strip-components=1 -C $LOCATION \*/goswitch

echo 'Done, try "goswitch version" command'
