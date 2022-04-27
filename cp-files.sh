#!/usr/bin/env bash

cp -R cofig/* $HOME/.config
mkdir -p $HOME/Pictures/Wallpapers
cp -R walls $HOME/Pictures/Wallpapers
cp -R fonts $HOME/.local/share
chmod +x $HOME/.config/bin/*
