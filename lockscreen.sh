#!/bin/bash
#script for locking screen
#based on:
# https://github.com/meskarune/i3lock-fancy
#pauses cmus (author's preferred music player)
#takes screenshot of screen, blurs it, puts original image over it
scrot -z -q 25% -m /tmp/screen.png
mogrify -scale 5% -scale 500% -blur 0x2 -scale 400% -fill black -colorize 20% /tmp/screen.png
convert /tmp/screen.png -coalesce -gravity south -draw 'image over 0,0 0,0 "/home/maps/Scripts/Files/close.png"' -layers Optimize /tmp/screen.png  
i3lock -u -e -i /tmp/screen.png
if cmus-remote -C status | grep 'status playing' > /dev/null
then
  echo "cmus has been paused."
  exec cmus-remote -u
fi
rm /tmp/screen.png
