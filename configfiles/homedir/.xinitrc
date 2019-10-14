
[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources
[ -f ~/.Xdpi ] && xrdb -merge ~/.Xdpi
setxkbmap -model pc105 -layout us -variant altgr-intl
#setxkbmap -model pc105 -layout us,us -variant altgr-intl,workman-intl -option grp:alt_shift_toggle

