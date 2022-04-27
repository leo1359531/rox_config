#!/usr/bin/env bash

sudo pacman -Syu
sudo pacman -S --needed git base-devel neofetch neovim kitty zsh firefox mako \
waybar ranger xorg-xwaybar curl wget python-pip fish wl-clipboard libnotify fuse \
vi fortune-mod noto-fonts-emoji
