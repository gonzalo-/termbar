#!/bin/sh -x

xrdb -merge $HOME/.Xresources

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export XMODIFIERS=@im=uim
export GTK_IM_MODULE="uim"
export MOZ_USE_XINPUT2=1
export MOZ_ACCELERATED=1
export MOZ_WEBRENDER=1

## no bell
xset b 0 0 0

# DBus
if [ -x /usr/local/bin/dbus-launch -a -z "${DBUS_SESSION_BUS_ADDRESS}" ]; then
	eval `dbus-launch --sh-syntax --exit-with-x11`
fi

# Termbar
exec xterm -fs 12 -bg "black" -fg "grey" -name termbar -class termbar -T termbar -e ~/code/termbar &

# Wallpaper
feh --bg-center ~/themes/blade-runner--wallpaper.jpg &

exec cwm
