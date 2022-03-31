
"""
    Script to generate the sxhdc configuration
"""


browser, editor, fileManager, mail, terminal = "brave", "code", "thunar", "evolution", "alacritty"

keycodes = {
    "alt Escape": "xfce4-taskmanager",
    "alt F1": "rofi -show window",
    "alt F2": "rofi -show drun",
    "alt F3": "rofi -show file-browser-extended",
    "alt F4": "rofi -show ssh",
    "alt F5": "menu_apps",
    "alt F6": "menu_time",
    "alt F7": "menu_network",
    "alt h": f"{terminal} -e htop",
    "alt Left": "variety -p",
    "alt Print": "xfce4-screenshooter",
    "alt Right": "variety -n",
    "ctrl alt 1": f"{terminal} -e xrandr --output eDP1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --off --output HDMI2 --off",
    "ctrl alt 2": f"{terminal} -e xrandr --output eDP1 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI2 --mode 1920x1080 --pos 0x0 --rotate normal",
    "ctrl alt h": "rofi -show file-browser-extended -file-browser-dir ~/.config",
    "ctrl alt j": "rofi -show file-browser-extended -file-browser-dir ~/Git",
    "ctrl alt k": "rofi -show file-browser-extended -file-browser-dir ~/.screenlayout",
    "ctrl alt l": "rofi -show file-browser-extended -file-browser-dir ~/Proyectos",
    "ctrl alt o": "picom ~/.config/picom/picom-toggle.sh",
    "super a": "xfce4-appfinder",
    "super b": "bitwarden-desktop",
    "super c": "catfish",
    "super e": f"{editor}",
    "super f": "firefox",
    "super F1": f"{browser}",
    "super F10": "spotify",
    "super F12": "rofi -show run",
    "super F2": f"{editor}",
    "super F3": "inkscape",
    "super F4": "gimp",
    "super F5": "meld",
    "super F6": "vlc --video-on-top",
    "super F7": "virtualbox",
    "super F8": f"{fileManager}",
    "super F9": f"{mail}",
    "super g": "gparted",
    "super i": "idea",
    "super KP_Enter": "gnome-calculator",
    "super m": "pragha",
    "super o": "obs",
    "super p": "pycharm",
    "super Return": f"{terminal}",
    "super s": "pamac-manager",
    "super v": "vlc --video-on-top",
    "super x": "arcolinux-logout",
    "super z": "zeal",
    "super shift Escape": "xkill",
    "super shift s": "pkill -USR1 -x sxhkd",
    "Print": "scrot 'screenshot_%Y%m%d_%H%M%S.jpg' -e 'mv $f $$(xdg-user-dir SCREENSHOTS)'",
    "XF86AudioLowerVolume": "amixer set Master 5%-",
    "XF86AudioMute": "amixer -D pulse set Master 1+ toggle",
    "XF86AudioNext": "playerctl next",
    "XF86AudioPlay": "playerctl play-pause",
    "XF86AudioPrev": "playerctl previous",
    "XF86AudioRaiseVolume": "amixer set Master 5%+",
    "XF86AudioStop": "playerctl stop",
    "XF86MonBrightnessDown": "xbacklight -dec 5",
    "XF86MonBrightnessUp": "xbacklight -inc 5"
}


def generate_shortcuts():
    output = ''
    for (k, v) in keycodes.items():
        mods = ' + '.join(k.split())
        output += f'{mods}\n\t{v}\n'
    return output


def generate_file():
    f = open('sxhkdrc', 'w')
    f.write(generate_shortcuts())
    f.close


def main():
    print('Generate file')
    generate_file()
    print('END')


if __name__ == '__main__':
    main()
