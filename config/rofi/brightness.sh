#!/usr/bin/env bash

## Author  : Aditya Shakya (adi1090x)
## Github  : @adi1090x
#
## Applets : Brightness

# Import Current Theme
theme="$HOME/.dotfiles/config/rofi/themes/brightness.rasi"

# Function to get brightness and level
get_brightness_info() {
  backlight="$(printf "%.0f\n" `light -G`)"
  card="`light -L | grep 'backlight' | head -n1 | cut -d'/' -f3`"
  if [[ $backlight -ge 0 ]] && [[ $backlight -le 29 ]]; then
    level="Low"
  elif [[ $backlight -ge 30 ]] && [[ $backlight -le 49 ]]; then
    level="Optimal"
  elif [[ $backlight -ge 50 ]] && [[ $backlight -le 69 ]]; then
    level="High"
  elif [[ $backlight -ge 70 ]] && [[ $backlight -le 100 ]]; then
    level="Peak"
  fi
}

# Function to display menu
rofi_cmd() {
  rofi -theme-str "window {width: $win_width;}" \
    -theme-str "listview {columns: $list_col; lines: $list_row;}" \
    -theme-str 'textbox-prompt-colon {str: "";}' \
    -dmenu \
    -p "$prompt" \
    -mesg "$mesg" \
    -markup-rows \
    -theme ${theme}
  }

# Function to execute the chosen command
run_cmd() {
  case "$1" in
    "$option_1")
      light -A 10
      ;;
    "$option_2")
      light -S 50
      ;;
    "$option_3")
      light -U 10
      ;;
    "$option_4")
      xfce4-power-manager-settings
      ;;
  esac
}

    # Get brightness info
    get_brightness_info

    # Update prompt and message
    prompt="${backlight}%"
    mesg="Device: ${card}, Level: $level"

    list_col='1'
    list_row='4'
    win_width='120px'

    # Options
    layout=`cat ${theme} | grep 'USE_ICON' | cut -d'=' -f2`
    if [[ "$layout" == 'NO' ]]; then
      option_1=" Increase"
      option_2=" Optimal"
      option_3=" Decrease"
      option_4=" Settings"
    else
      option_1=""
      option_2=""
      option_3=""
      option_4=""
    fi

    # Display menu and get user choice
    chosen=$(echo -e "$option_1\n$option_2\n$option_3\n$option_4" | rofi_cmd)

    # Execute the chosen command
    run_cmd "$chosen"

