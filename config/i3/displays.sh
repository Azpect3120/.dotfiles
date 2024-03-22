#!/usr/bin/env bash

xrandr --output DP-0 --auto --primary \
  --output DP-2 --auto --right-of DP-0 \
  --output HDMI-0 --auto --rotate right --left-of DP-0
