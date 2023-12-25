#!/bin/bash

WDIR="$HOME/my_data"

# init user environment
# +++++++++++++++++++++++++++++++

cp -af $WDIR/home/. $HOME

fontDir="$HOME/.local/share/fonts"
mkdir -p $fontDir
cp "$HOME/my_data/fonts/*.ttf" $fontDir

if which fc-cache >/dev/null 2>&1 ; then
  fc-cache -f "$fontDir"
fi

dconf load /org/mate/terminal/profiles/profile0/ < $WDIR/mate-terminal/profile0.mtconf
dconf load /org/mate/terminal/global/ < $WDIR/mate-terminal/global.mtconf

# return to the previous working directory