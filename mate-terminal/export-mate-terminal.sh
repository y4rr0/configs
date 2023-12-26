#!/bin/bash
# exports default terminal settings
mkdir -p ~/my_data/mate-terminal

dconf dump /org/mate/terminal/profiles/ > ~/my_data/mate-terminal/profile.mtconf
dconf dump /org/mate/terminal/global/ > ~/my_data/mate-terminal/global.mtconf