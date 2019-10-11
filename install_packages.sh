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
    diffutils
    dmenu
    dunst
    fossil
    gcc
    herbstluftwm
    libnotify
    make
    neovim
    network-manager-applet
    patch
    pavucontrol
    pkg-config
    tmux
    trayer
    unzip
    vifm
    wget
    xclip
    xorg-server
    xterm
    "

    case $DISTRO_TYPE in
    arch)
        echo "
        jshon
        networkmanager
        noto-fonts
        noto-fonts-emoji
        ttf-dejavu
        ttf-inconsolata
        ttf-liberation
        ttf-linux-libertine
        xorg-fonts-encodings
        xorg-font-utils
        xorg-xset
        xorg-xsetroot
        xorg-xrandr
        xorg-twm
        xorg-xclock
        xorg-xinit
        yay
        "
    ;;
    void)
        echo "
        dejavu-fonts-ttf
        font-inconsolata-otf
        font-libertine-ttf
        fontconfig
        fonts-droid-ttf
        fonts-roboto-ttf
        lemonbar-xft
        liberation-fonts-ttf
        NetworkManager
        noto-fonts-emoji
        noto-fonts-ttf
        noto-fonts-ttf-extra
        xorg-fonts
        xorg-apps
        xorg-minimal
        xorg-server-devel
        "
    ;;
    esac }

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
