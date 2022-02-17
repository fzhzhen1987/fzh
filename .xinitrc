#!/bin/sh

#设定小红点速度
# obtain TrackPoint ID from xinput list
TP_ID=`xinput list | grep TrackPoint | cut -f 2 | grep -Eo '[0-9]{1,}'`

if [ -n "$TP_ID" ]; then
    # obtain properties from xinput list-props "$TP_ID"
    AS_ID=$(xinput list-props "$TP_ID" | grep 'Accel Speed (' | cut -f 2 | grep -Eo '[0-9]{1,}')

    # set the speed you want
    xinput set-prop "$TP_ID" "$AS_ID" -0.005
fi

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/Xmodmap

# merge in defaults and keymaps
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi


if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#twm &
#xclock -geometry 50x50-1+1 &
#xterm -geometry 80x50+494+51 &
#xterm -geometry 80x20+494-0 &
#exec xterm -geometry 80x66+0+0 -name login

exec gnome-session
