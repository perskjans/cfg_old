#!/bin/bash

CURRENT_DIR=$(pwd)

if [[ $CURRENT_DIR == $HOME ]]; then
    echo -e "\nYou must run this script from the directory of the script!\n"
    exit 1
fi


# Dirs
if [ ! -d ~/cfg ]; then
    ln -snf $CURRENT_DIR ~/cfg
fi
ln -snf $CURRENT_DIR/bin ~/bin

CONFIGDIR=$CURRENT_DIR/configfiles/configdir
pushd $CONFIGDIR >/dev/null

for dir in /tmp $(grep -o '/.*"$' user-dirs.dirs | tr '"\n' ' ')
do
    mkdir -p -m 755 $HOME$dir
done

for dir in Desktop Documents Downloads Music Pictures Public Templates Videos
do
    rm -rf $HOME/$dir
done

files=$(find . -maxdepth 1 | sed "s/^\.//g")

for file in $files
do
    file=${file#/}
    path=$CONFIGDIR/$file

    if [[ -d "$path" ]]; then
        mkdir -m 755 -p ~/.config/$file
        chmod 755 ~/.config/$file  # in case the dir already exists with faulty permissions

        for subfile in $path/*
        do
            ln -snf $subfile -t ~/.config/$file/
        done
    else
        ln -snf $path -t ~/.config/
    fi
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
