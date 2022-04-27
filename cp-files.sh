#!/usr/bin/env bash

cp -R config/* $HOME/.config
mkdir -p $HOME/Pictures/Wallpapers
cp -R walls $HOME/Pictures/Wallpapers
cp -R fonts $HOME/.local/share
chmod +x $HOME/.config/bin/*
mkdir -p $HOME/Stuffs
mkdir -p $HOME/Git
chsh
