#!/bin/sh

packages_to_install()
{

    echo alsa-utils
    echo arandr
    echo autoconf
    echo automake
    echo bash
    echo bash-completion
    echo dmenu
    echo dzen2
    echo fakeroot
    echo fossil
    echo gcc
    echo herbstluftwm
    echo jshon
    echo make
    echo mesa
    echo neovim
    echo patch
    echo pkg-config
    echo tmux
    echo unrar
    echo unzip
    echo vifm
    echo wget
    echo xf86-video-vesa
    echo xorg-fonts-encoding
    echo xorg-font-utils
    echo xorg-server
    echo xorg-twm
    echo xorg-xclock
    echo xorg-xinit
    echo xorg-xrandr
    echo xterm

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


pi $(packages_to_install)
