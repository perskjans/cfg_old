#!/bin/bash

CURRENT_DIR=$(pwd)
echo $CURRENT_DIR

# Dirs
if [ ! -d ~/linux_config ]; then
    ln -snf $CURRENT_DIR ~/linux_config
fi
ln -snf $CURRENT_DIR/bin ~/bin
#ln -snf /media ~/media

mkdir -p ~/.config

CONFIGDIR=$CURRENT_DIR/configfiles/configdir
pushd $CONFIGDIR
dirs=$(find . -maxdepth 1 -type d | sed "s/^\.//g" | sed "s/\.\///g")

for dir in $dirs
do
    ln -snf $CONFIGDIR/$dir -t ~/.config/
done

popd
echo

HOMEDIRFILES=$CURRENT_DIR/configfiles/homedir
pushd $HOMEDIRFILES
files=$(find . -maxdepth 1 | sed "s/^\.//g" | sed "s/\.\///g")

for f in $files
do
    ln -snf $HOMEDIRFILES/$f ~/
done

popd

# FONTS
#ln -snfT $HOMEDIRFILES/.fonts ~/.local/share/fonts

# VIM
ln -snf $CONFIGDIR/nvim  ~/.vim
ln -snf $CONFIGDIR/nvim/init.vim  ~/.vimrc

