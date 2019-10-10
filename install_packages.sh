#!/bin/sh

packages_to_install()
{

    echo "
    alsa-utils
    arandr
    autoconf
    automake
    bash
    bash-completion
    dmenu
    dunst
    fossil
    gcc
    herbstluftwm
    jshon
    make
    mesa
    neovim
    patch
    pkg-config
    tmux
    unrar
    unzip
    vifm
    wget
    xclip
    xf86-video-vesa
    xorg-fonts-encodings
    xorg-font-utils
    xorg-server
    xorg-twm
    xorg-xclock
    xorg-xinit
    xorg-xrandr
    xorg-xset
    xorg-xsetroot
    xterm
    "

    case $DISTRO_TYPE in
    arch)

        echo noto-fonts
        echo noto-fonts-emoji
        echo ttf-dejavu
        echo ttf-inconsolata
        echo ttf-liberation
        echo ttf-linux-libertine

    ;;
    esac
}

#xorg-server-utils
#multilib-devel
#linux-headers catalyst-dkms catalyst-utils lib32-catalyst-utils
#nvidia lib32-nvidia-utils

for f in ~/cfg/lib/*_linux_specific; do . $f; done

pi $(packages_to_install)
