#!/bin/bash
mkdir -p $PREFIX/etc/apt/sources.list.d
# Use './' so apt automatically detects the root repository structure
echo "deb [trusted=yes] https://kilomiketango.github.io/ytdownloader-repo/ ./" > $PREFIX/etc/apt/sources.list.d/ytdownloader.list
pkg update
pkg install ytdownloader -y
echo "Install လုပ်ပြီးပါပြီ!"
