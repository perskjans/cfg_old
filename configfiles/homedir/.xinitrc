#!/bin/sh

[ -f ~/.xprofile ] && . ~/.xprofile

#exec herbstluftwm
#exec openbox
exec $CURRENTWM
