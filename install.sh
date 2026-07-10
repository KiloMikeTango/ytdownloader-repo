#!/bin/bash
mkdir -p $PREFIX/etc/apt/sources.list.d
# Notice the addition of 'dists' in the URL below
echo "deb https://kilomiketango.github.io/ytdownloader-repo dists/stable main" > $PREFIX/etc/apt/sources.list.d/ytdownloader.list
pkg update
pkg install ytdownloader -y
echo "Install လုပ်ပြီးပါပြီ! [ytdownloader] လို့ရိုက်ပြီးသုံးနိုင်ပါပြီ။"
