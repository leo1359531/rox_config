#!/usr/bin/env bash
 pushd $HOME/Git
 git clone https://aur.archlinux.org/yay.git
 pushd yay
 makepkg -si
 popd
 
