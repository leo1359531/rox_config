#!/usr/bin/env bash
 pushd Sources
 git clone https://aur.archlinux.org/yay.git
 pushd yay
 makepkg -si
 popd
 
