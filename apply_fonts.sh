#!/bin/sh

###
### This script will link font files generate font settings
###

mkdir -p ~/.local/share/fonts

cd ~/.local/share/fonts

for f in ~/cfg/fonts/*
do
    ln -sf $f
done



mkfontscale
mkfontdir

xset fp rehash
fc-cache

xset q
