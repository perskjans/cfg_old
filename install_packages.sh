#!/bin/sh

case $DISTRO_TYPE in
debian)
    os_specific_file=~/cfg/lib/debian_linux_specific
;;
redhat)
    os_specific_file=~/cfg/lib/redhat_linux_specific
;;
arch)
    os_specific_file=~/cfg/lib/arch_linux_specific
;;
void)
    os_specific_file=~/cfg/lib/void_linux_specific
;;
esac

[ -f $os_specific_file ] && . $os_specific_file

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
    echo xclip
    echo xf86-video-vesa
    echo xorg-fonts-encodings
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
