#!/bin/bash

# For non-fontconfig applications. Maybe we need this, maybe now
# Just playing it safe
xset fp rehash

xcalib -d :0 /home/ncdulo/ASUS_VG248QE_Nvidia.icm

exec ck-launch-session dbus-launch --sh-syntax --exit-with-session awesome
