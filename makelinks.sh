#!/bin/bash

CURRENT_DIR=$(pwd)
echo $CURRENT_DIR

if [[ $CURRENT_DIR == $HOME ]]; then
    echo -e "\nYou must run this script from the directory of the script!\n"
fi


# Dirs
if [ ! -d ~/cfg ]; then
    ln -snf $CURRENT_DIR ~/cfg
fi
ln -snf $CURRENT_DIR/bin ~/bin

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
    ln -snf $HOMEDIRFILES$f ~/
done

popd


# VIM
ln -snf $CONFIGDIR/nvim  ~/.vim
ln -snf $CONFIGDIR/nvim/init.vim  ~/.vimrc

# For easier use of plugins in vim
if [[ ! -d ~/.vim/plugins/Vundle.vim ]]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/plugins/Vundle.vim
fi

DCDIR=$CURRENT_DIR/dc++/
pushd $DCDIR

for f in *; do ln -snf ${DCDIR}$f ~/.dc++/$f ; done

popd