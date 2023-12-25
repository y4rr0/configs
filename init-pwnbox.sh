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
  wget  https://github.com/y4rr0/configs/raw/main/fira-code/FiraCode-SemiBold.ttf -O fonts/FiraCode-SemiBold.ttf
fi

if [ ! -d $WDIR/home ]; then
  mkdir -p home
  cd home
  wget https://raw.githubusercontent.com/y4rr0/configs/main/tmux/.tmux.conf
  git clone https://github.com/tmux-plugins/tpm .tmux/plugins/tpm
  cd $WDIR
  mkdir -p .ssh
  ssk-keygen -t rsa -f .ssh/id_rsa
fi

if [ ! -d $WDIR/mate-terminal ]; then
  mkdir -p mate-terminal
fi

wget https://raw.githubusercontent.com/y4rr0/configs/main/user_init  --backups=1
chmod +x user_init
./user_init

# return to the previous working directory
cd $PREV_PWD