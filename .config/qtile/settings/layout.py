from libqtile import layout
from settings.shortcut import colors


# def init_layout_theme():
#     return


layout_theme = {
    "margin": 4,
    "border_width": 2,
    "border_focus": colors["focus"],
    "border_normal": colors["inactive"],
}

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
        {"wmclass": "confirm"},
        {"wmclass": "dialog"},
        {"wmclass": "download"},
        {"wmclass": "error"},
        {"wmclass": "file_progress"},
        {"wmclass": "notification"},
        {"wmclass": "splash"},
        {"wmclass": "toolbar"},
    ],
    border_normal=colors["color4"],
    border_focus=colors["focus"],
)
