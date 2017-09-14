#!/bin/sh
IMAGE="/tmp/lock_screen.png"
scrot $IMAGE
# Resizing for speed increase at blurring
convert $IMAGE -resize 12.5% $IMAGE
convert $IMAGE -blur 1x2 $IMAGE
convert $IMAGE -resize 800% $IMAGE
i3lock -i $IMAGE
