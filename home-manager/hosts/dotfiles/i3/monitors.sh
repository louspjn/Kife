if xrandr | grep "HDMI-1 connected"; then
  xrandr --output eDP-1 --off
fi
