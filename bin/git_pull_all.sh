#!/bin/bash

red=`tput setaf 1`
yellow=`tput setaf 3`
blue=`tput setaf 4`
reset_color=`tput sgr0`

function pull()
{
    dir=$1
    color=$reset

    cd $dir
    pwd
    result=`git pull`

    if [ $? -ne 0 ]; then
        color=$red
    fi

    echo "${color}${result}${reset_color}"
    echo
}


echo
echo ========== formaner ==========
echo

for dir in ~/projects/_formaner/*; do pull $dir ; done

echo
echo ========== tools ==========
echo

for dir in ~/projects/tools/*; do pull $dir ; done

echo
echo ========== hiera ==========
echo

for dir in ~/projects/hiera*; do pull $dir ; done

echo
echo ========== puppet ==========
echo

for dir in ~/projects/tools/*; do pull $dir ; done

cd


