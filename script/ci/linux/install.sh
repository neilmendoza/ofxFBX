#!/bin/bash

# get script location to deduct OFXFBX_ROOT
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
OFXFBX_ROOT=$DIR/../../..

mkdir -p /tmp/fbx202031_fbxsdk_linux
cd /tmp/fbx202031_fbxsdk_linux
wget --user-agent="openFrameworks" https://www.autodesk.com/content/dam/autodesk/www/adn/fbx/2020-3-1/fbx202031_fbxsdk_linux.tar.gz
tar xvfz fbx202031_fbxsdk_linux.tar.gz

# install in temp directory (not system wide)
mkdir installed
chmod +x fbx202031_fbxsdk_linux
./fbx202031_fbxsdk_linux ./installed

# copy to ofxFBX
if [ "$1" = "debug" ]; then
    echo "debug"
    cp ./installed/lib/gcc/x86/debug/libfbxsdk.a   ${OFXFBX_ROOT}/libs/libfbxsdk_2020.3.1/lib/linux/libfbxsdk.a
    cp ./installed/lib/gcc/x64/debug/libfbxsdk.a   ${OFXFBX_ROOT}/libs/libfbxsdk_2020.3.1/lib/linux64/libfbxsdk.a
else
    echo "release"
    cp ./installed/lib/gcc/x86/release/libfbxsdk.a ${OFXFBX_ROOT}/libs/libfbxsdk_2020.3.1/lib/linux/libfbxsdk.a
    cp ./installed/lib/gcc/x64/release/libfbxsdk.a ${OFXFBX_ROOT}/libs/libfbxsdk_2020.3.1/lib/linux64/libfbxsdk.a
fi
