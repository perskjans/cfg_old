#!/bin/sh

packages_to_install()
{
    case $DISTRO_TYPE in
    arch)
        echo jshon
        echo lxappearance
        echo lxappearance-obconf
        echo network-manager-applet
        echo networkmanager
        echo noto-fonts
        echo noto-fonts-emoji
        echo trayer
        echo ttf-dejavu
        echo ttf-inconsolata
        echo ttf-liberation
        echo ttf-linux-libertine
        echo xorg-font-utils
        echo xorg-fonts-encodings
        echo xorg-twm
        echo xorg-xclock
        echo xorg-xinit
        echo xorg-xrandr
        echo xorg-xset
        echo xorg-xsetroot
    ;;
    void)
        echo NetworkManager
        echo dejavu-fonts-ttf
        echo font-inconsolata-otf
        echo font-libertine-ttf
        echo fontconfig
        echo fonts-droid-ttf
        echo fonts-roboto-ttf
        echo libX11-devel
        echo libXft-devel
        echo liberation-fonts-ttf
        echo lxappearance
        echo lxappearance-obconf
        echo menumaker
        echo noto-fonts-emoji
        echo noto-fonts-ttf
        echo noto-fonts-ttf-extra
        echo openbox
        echo trayer-srg
        echo xorg
    ;;
    esac

    echo alsa-utils
    echo arandr
    echo automake
    echo bash
    echo bash-completion
    echo diffutils
    echo dmenu
    echo dunst
    echo fossil
    echo gcc
    echo herbstluftwm
    echo libnotify
    echo lightdm
    echo lightdm-gtk-greeter
    echo make
    echo neovim
    echo patch
    echo pavucontrol
    echo pkg-config
    echo tmux
    echo unzip
    echo vifm
    echo vim
    echo volumeicon
    echo wget
    echo xclip
    echo xterm
}

#xorg-server-utils
#multilib-devel
#linux-headers catalyst-dkms catalyst-utils lib32-catalyst-utils
#nvidia lib32-nvidia-utils

for f in ~/cfg/lib/*_linux_specific; do . $f; done

pi $(packages_to_install)

case $DISTRO_TYPE in
arch)
    yay -S lemonbar-xft-git
;;
esac
