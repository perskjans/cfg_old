#!/bin/bash

CURRENT_DIR=$(pwd)
echo $CURRENT_DIR

if [[ $CURRENT_DIR == $HOME ]]; then
    echo -e "\nYou must run this script from the directory of the script!\n"
    exit 1
fi


# Dirs
if [ ! -d ~/cfg ]; then
    ln -snf $CURRENT_DIR ~/cfg
fi
ln -snf $CURRENT_DIR/bin ~/bin

mkdir -p ~/.config

CONFIGDIR=$CURRENT_DIR/configfiles/configdir
pushd $CONFIGDIR >/dev/null
dirs=$(find . -maxdepth 1 -type d | sed "s/^\.//g" | sed "s/\.\///g")

for dir in $dirs
do
    targetdir=~/.config/$dir
    if [[ -L $targetdir ]]; then
        rm $targetdir
    fi

    mkdir -m 755 -p $targetdir
    chmod 755 $targetdir  # in case the dir already exists with faulty permissions

    for file in $CONFIGDIR/$dir/*
    do
        ln -snf $file -t ~/.config/$dir/
    done
done

popd >/dev/null
echo

HOMEDIRFILES=$CURRENT_DIR/configfiles/homedir
pushd $HOMEDIRFILES >/dev/null
files=$(find . -maxdepth 1 | sed "s/^\.//g")

for file in $files
do
    file=${file#/}
    path=$HOMEDIRFILES/$file
    if [[ -d "$path" ]]; then
        mkdir -m 755 -p ~/$file
        chmod 755 ~/$file  # in case the dir already exists with faulty permissions
    else
        ln -snf $path -t ~/
    fi
done

popd >/dev/null


# VIM
ln -snf $CONFIGDIR/nvim  ~/.vim
ln -snf $CONFIGDIR/nvim/init.vim  ~/.vimrc

# For easier use of plugins in vim
if [[ ! -d ~/.vim/plugins/Vundle.vim ]]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/plugins/Vundle.vim
fi

