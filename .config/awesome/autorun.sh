#!/usr/bin/env bash

# Run some programs when Awesome starts.
# If a program is intended to only have a single instance, call it using
#   run program_name [arguments]
# That is useful when re-loading Awesome so that we don't end up with
# multiple instances of auto-start programs all over the place.

function run {
    if ! pgrep -f $1 ;
    then
        $@&
    fi
}

# Setup programs, these fire off once and that's it
xrandr --output DVI-I-1 --mode 1920x1080 --refresh 120
xcalib -d :0 /home/ncdulo/ASUS_VG248QE_Nvidia.icm
xset fp+ /usr/share/fonts/terminus
xset fp+ /usr/share/fonts/inconsolata
xset fp rehash
numlockx on

# Long running programs, should only run once
run parcellite
run pasystray
run xscreensaver -nosplash
run /home/ncdulo/dev/bin/process_xscreensaver.sh
