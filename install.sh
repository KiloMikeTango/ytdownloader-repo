#!/data/data/com.termux/files/usr/bin/bash

set -e

if [ -z "$PREFIX" ]; then
    echo "Error: This installer must run inside Termux."
    exit 1
fi

REPO="https://kilomiketango.github.io/ytdownloader-repo"

mkdir -p "$PREFIX/etc/apt/sources.list.d"

echo "deb [trusted=yes] $REPO stable main" \
    > "$PREFIX/etc/apt/sources.list.d/ytdownloader.list"

apt update

apt install ytdownloader -y
