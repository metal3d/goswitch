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
    echo "Prefer $HOME/.local/bin or $HOME/bin if they are in list please." 
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

which curl 2>&1 >/dev/null || echo "You need curl to complete instalation"
select_path

curl -sSL \
    $(curl -s https://api.github.com/repos/metal3d/goswitch/releases/latest | grep tarball | cut -d '"' -f 4) | \
    tar -zxf - --strip-components=1 -C $LOCATION \*/goswitch
