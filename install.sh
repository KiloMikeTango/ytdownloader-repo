#!/bin/bash
mkdir -p $PREFIX/etc/apt/sources.list.d
# The trailing '/' is very important here
echo "deb [trusted=yes] https://kilomiketango.github.io/ytdownloader-repo/ ./" > $PREFIX/etc/apt/sources.list.d/ytdownloader.list
pkg update
pkg install ytdownloader -y
