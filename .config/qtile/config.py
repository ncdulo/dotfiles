# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import os
from subprocess import call, check_output
from typing import List  # noqa: F401

from libqtile import bar, extension, hook, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

mod = "mod4"
#terminal = guess_terminal()
terminal = "/usr/bin/urxvt"
home = os.path.expanduser('~')
wallpaper = '/dev/dotfiles/nuclear-cheers.png'

def get_weather():
    return check_output(home + "/dev/bin/qtile_weather.sh").decode('utf-8').strip()

# Group names
group_names = [
        "1", "2", "3",
        "4", "5", "6",
        "7", "8", "9",
    ]

# Group display names
group_labels = [
        "1:term", "2:chat", "3:www",
        "4:dev", "5:media", "6:game",
        "7:uranus", "8:neptune", "9:pluto",
    ]

# Allow only matched windows in this group?
group_exclusives = [
        False, False, False,
        False, False, False,
        False, False, False,
    ]

# Should this group stay alive with no member windows?
group_persists = [
        True, True, True,
        True, True, True,
        True, True, True,
    ]

# Is this group alive when qtile starts?
group_inits = [
        True, True, True,
        True, True, True,
        True, True, True,
    ]

# Default layout for each group
group_layouts = [
        "ratiotile", "ratiotile", "monadtall",
        "monadtall", "max", "max",
        "coulmns", "columns", "columns",
    ]

# Match objects assigned to groups
group_matches = [
        None,
        [Match(wm_class=["discord", "hexchat", "slack"]), ],
        [Match(wm_class=["firefox", "Navigator"]), ],
        [Match(wm_class=["geany",]), ],
        [Match(wm_class=["vlc", "clementine", "smplayer", "MPlayer",
            "mpv", "Rhythmbox", "strawberry", "Strawberry",]), ],
        [Match(wm_class=["Steam", "Wine",]), ],
        None,
        None,
        None,
    ]

keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(),
        desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),

    # Used with the monad{tall,wide} layouts
    Key([mod], "i", lazy.layout.grow(), desc="Grow focused window"),
    Key([mod], "m", lazy.layout.shrink(), desc="Shrink focused window"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key([mod], "o", lazy.layout.maximize(), desc="Grow focused window to max size"),
    Key([mod], "space", lazy.layout.flip()),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Switch to next layout"),
    Key([mod, "shift"], "Tab", lazy.prev_layout(), desc="Switch to previous layout"),

    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod], "f", lazy.window.toggle_fullscreen(), desc="Toggle fullscreen"),


    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(),
        desc="Spawn a command using a prompt widget"),

    # Media/Special keys
    Key([], "XF86AudioMute", lazy.spawn("pactl set-sink-mute 1 toggle")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pactl set-sink-volume 1 +5%")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("pactl set-sink-volume 1 -5%")),
    Key([], "XF86Calculator", lazy.spawn("speedcrunch")),

    # Screenshotters
    Key([], "Print",
            lazy.spawn("scrot '%s.png' -e 'mv $f " + home + "/screenshots/'")
        ),
    Key(["mod1"], "Print",
            lazy.spawn("scrot -s 'selection-%s.png' -e 'mv $f " + home + "/screenshots/'")
        ),

    Key([mod], "Escape", lazy.spawn("xscreensaver-command -lock")),
]

groups = []
# Populate our groups using the lists defined at the beginning
# of this source file
for i in range(len(group_names)):
    groups.append(
            Group(
                name=group_names[i],
                matches=group_matches[i],
                exclusive=group_exclusives[i],
                layout=group_layouts[i].lower(),
                persist=group_persists[i],
                init=group_inits[i],
                label=group_labels[i],))

# Assign keybinds per group
for i in groups:
    keys.extend([
        # mod + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),
        # mod + shift + letter of group = move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            desc="Move focused window to group {}".format(i.name)), ])

layout_style = {
        'margin': 0,
        'border_width': 1,
        'border_normal': '#220000',
        'border_focus': '#881111',
    }

layouts = [
    layout.Columns(border_focus_stack='#d75f5f', **layout_style),
    layout.RatioTile(**layout_style),
    layout.Tile(**layout_style),
    layout.MonadTall(**layout_style),
    layout.MonadWide(**layout_style),
    layout.Max(**layout_style),
    layout.Zoomy(column_width=420, **layout_style),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    #font='sans',
    font='terminus',
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

sensor_widget_defaults = {
        "threshold": 180.0,
        "foreground_alert": "#d75f5f",
        "metric": False,
        "update_interval": 3,
    }

top_bar = [
        widget.Prompt(
            bell_style="visual",
            cursor_color="#ffffff",
            cursorblink=0.8,
            prompt="$ "),
        widget.GroupBox(
            disable_drag=True,
            hide_unused=True,
            inactive="#808080"),
        widget.TextBox("::"),
        widget.WindowName(),
        widget.Spacer(length=bar.STRETCH),
        # Do we even have key chords/need this?
        widget.Chord(
            chords_colors={
                'launch': ("#ff0000", "#ffffff"),
            },
            name_transform=lambda name: name.upper(),
        ),
        widget.Systray(),
        #widget.Clock(format='%Y-%m-%d %a %H:%M'),
        widget.Clock(format='%a %b %d %Y %H:%M'),
    ]

bottom_bar = [
        widget.CurrentLayout(),
        widget.TextBox("::"),
        widget.CPU(format="CPU Load {load_percent}%"),
        widget.TextBox("::"),
        widget.ThermalSensor(tag_sensor="Core 1", **sensor_widget_defaults),
        widget.TextBox("|"),
        widget.ThermalSensor(tag_sensor="Core 2", **sensor_widget_defaults),
        widget.TextBox("|"),
        widget.ThermalSensor(tag_sensor="Core 3", **sensor_widget_defaults),
        widget.TextBox("|"),
        widget.ThermalSensor(tag_sensor="Core 4", **sensor_widget_defaults),
        widget.TextBox("::"),
        widget.Net(format="{down}↓ {up}↑", interface="enp4s0"),
        widget.Spacer(length=bar.STRETCH),
        widget.CheckUpdates(
            custom_command="EIX_LIMIT=0 eix -u# --world",
            display_format="Potential Updates: {updates}",
            update_interval=3600),
        widget.TextBox("::"),
        widget.GenPollText(
            func=get_weather,
            update_interval=1800),
    ]

screens = [
    Screen(
        top=bar.Bar(top_bar, 24),
        bottom=bar.Bar(bottom_bar, 24),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])
auto_fullscreen = True
focus_on_window_activation = "smart"

# Hooks
@hook.subscribe.startup_once
def startup_once():
    call(home + '/.config/awesome/autorun.sh')
    call('feh --bg-scale ' + home + wallpaper)

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
