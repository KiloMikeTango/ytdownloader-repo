#!/bin/bash
mkdir -p $PREFIX/etc/apt/sources.list.d
# Point directly to the repo root. Apt appends /dists/ automatically.
echo "deb [trusted=yes] https://kilomiketango.github.io/ytdownloader-repo/ stable main" > $PREFIX/etc/apt/sources.list.d/ytdownloader.list
pkg update
pkg install ytdownloader -y
