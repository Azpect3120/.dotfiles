#!/usr/bin/env bash

count=$(xrandr --query | grep " connected" | wc -l)
echo $count
