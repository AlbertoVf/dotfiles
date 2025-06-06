#!/usr/bin/env sh

CONFIG="$HOME/.config"

function run {
    if ! pgrep "$1"; then
        "$@" &
    fi
}

sh "$HOME/.screenlayout/hdmi.sh" &
run picom --config "$CONFIG/picom/picom.conf"
run variety
run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
run sxhkd -c "$CONFIG/sxhkd/sxhkdrc"
run nm-applet
run xfce4-clipman
(conky -c ~/.conkyrc) &
