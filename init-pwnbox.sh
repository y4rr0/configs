#!/bin/bash
@echo off
PREV_PWD=$(pwd)
WDIR="$HOME/my_data"

cd $WDIR

if [ ! -d $WDIR/fonts ]; then
  mkdir -p fonts
  wget  https://github.com/y4rr0/configs/raw/main/fira-code/FiraCode-Bold.ttf -O fonts/FiraCode-Bold.ttf
  wget  https://github.com/y4rr0/configs/raw/main/fira-code/FiraCode-Light.ttf -O fonts/FiraCode-Light.ttf
  wget  https://github.com/y4rr0/configs/raw/main/fira-code/FiraCode-Medium.ttf -O fonts/FiraCode-Medium.ttf
  wget  https://github.com/y4rr0/configs/raw/main/fira-code/FiraCode-Regular.ttf -O fonts/FiraCode-Regular.ttf
  wget  https://github.com/y4rr0/configs/raw/main/fira-code/FiraCode-Retina.ttf -O fonts/FiraCode-Retina.ttf
  wget  https://github.com/y4rr0/configs/raw/main/fira-code/FiraCode-SemiBold.ttf -O FiraCode-SemiBold.ttf
fi

if [ ! -d $WDIR/home ]; then
  mkdir -p home
  mkdir -p .ssh
  ssk-keygen -t rsa -f .ssh/id_rsa
fi

if [ ! -d $WDIR/mate-terminal ]; then
  mkdir -p mate-terminal
fi

# init user environment

cp -af $HOME/my_data/home/. $HOME
fontDir="$HOME/.local/share/fonts"
mkdir -p $fontDir
cp "$HOME/my_data/fonts/*.ttf" $fontDir

if which fc-cache >/dev/null 2>&1 ; then
  fc-cache -f "$fontDir"
fi

dconf load /org/mate/terminal/profiles/profile0/ < $WDIR/mate-terminal/profile0.mtconf
dconf load /org/mate/terminal/global/ < $WDIR/mate-terminal/global.mtconf

# return to the previous working directory
cd $PREV_PWD