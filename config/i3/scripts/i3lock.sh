#!/bin/sh
IMAGE="/tmp/lock_screen.png"
scrot $IMAGE
convert $IMAGE -blur 20x25 $IMAGE
i3lock -i $IMAGE
