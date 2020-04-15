#!/bin/bash

# For non-fontconfig applications. Maybe we need this, maybe not
# Just playing it safe
xset fp rehash

xcalib -d :0 /home/ncdulo/ASUS_VG248QE_Nvidia.icm

# This is not normally called. I login via sddm, which then calls
# /etc/X11/Sessions/awesome. This simply exists to prevent head
# scratching if I ever need to `startx` after removing ConsoleKit2.
exec dbus-launch --sh-syntax --exit-with-session awesome
