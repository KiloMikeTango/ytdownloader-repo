#!/bin/bash
# 1. Add your repository to the Termux apt sources
mkdir -p $PREFIX/etc/apt/sources.list.d
echo "deb https://kilomiketango.github.io/ytdownloader-repo stable main" > $PREFIX/etc/apt/sources.list.d/ytdownloader.list

# 2. Update and install
pkg update
pkg install ytdownloader -y

echo "Install လုပ်ပြီးပါပြီ!'ytdownloader' လို့ရိုက်ပြီးသုံးနိုင်ပါပြီ။"
