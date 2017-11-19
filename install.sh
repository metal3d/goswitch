#!/bin/bash

curl -sSL $(curl -s https://api.github.com/repos/metal3d/goswitch/releases/latest | \
    grep tarball | cut -d '"' -f 4) | \
    tar -zxf - --strip-components=1 -C ~/.local/bin */goswitch
