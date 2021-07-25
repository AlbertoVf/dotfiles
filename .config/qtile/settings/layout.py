from libqtile import layout
from settings.shortcut import colors


def init_layout_theme():
    return {
        "margin": 4,
        "border_width": 2,
        "border_focus": colors["focus"],
        "border_normal": colors["inactive"],
    }


layout_theme = init_layout_theme()
layouts = [
    layout.MonadTall(**layout_theme),
    layout.MonadWide(**layout_theme),
    layout.Matrix(**layout_theme),
    layout.Bsp(**layout_theme),
    layout.Max(**layout_theme),
]
floating_types = ["notification", "toolbar", "splash", "dialog"]
floating_layout = layout.Floating(
    float_rules=[
        {"wmclass": "Arcolinux-welcome-app.py"},
        {"wmclass": "Arcolinux-tweak-tool.py"},
        {"wmclass": "confirm"},
        {"wmclass": "dialog"},
        {"wmclass": "download"},
        {"wmclass": "error"},
        {"wmclass": "file_progress"},
        {"wmclass": "notification"},
        {"wmclass": "splash"},
        {"wmclass": "toolbar"},
        {"wmclass": "confirmreset"},
        {"wmclass": "makebranch"},
        {"wmclass": "maketag"},
        {"wmclass": "ssh-askpass"},
        {"wmclass": "arcolinux-logout"},
        {"wmclass": "xfce4-terminal"},
        {"wmclass": "Galculator"},
        {"wmclass": "Arandr"},
        {"wname": "branchdialog"},
        {"wname": "Open File"},
        {"wname": "pinentry"},
    ],
    border_normal=colors["color4"],
    border_focus=colors["focus"],
)
