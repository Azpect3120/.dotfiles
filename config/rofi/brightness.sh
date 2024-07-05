#!/usr/bin/env bash

## Author  : Aditya Shakya (adi1090x)
## Github  : @adi1090x
#
## Applets : Brightness

# Import Current Theme
type="$HOME/.config/rofi/applets/type-3"
style='style-3.rasi'
theme="$type/$style"

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
        -theme ${theme} \
        -selected-row $1
}

# Function to execute the chosen command
lastPick=0
run_cmd() {
    case "$1" in
        "$option_1")
            light -A 20
            lastPick=0
            ;;
        "$option_2")
            light -S 50
            lastPick=1
            ;;
        "$option_3")
            light -U 20
            lastPick=2
            ;;
        "$option_4")
            xfce4-power-manager-settings
            lastPick=3
            ;;
    esac
}

# Main loop
while true; do
    # Get brightness info
    get_brightness_info

    # Update prompt and message
    prompt="${backlight}%"
    mesg="Device: ${card}, Level: $level"

    # Theme Elements
    if [[ "$theme" == *'type-1'* ]]; then
        list_col='1'
        list_row='4'
        win_width='400px'
    elif [[ "$theme" == *'type-3'* ]]; then
        list_col='1'
        list_row='4'
        win_width='120px'
    elif [[ "$theme" == *'type-5'* ]]; then
        list_col='1'
        list_row='4'
        win_width='425px'
    elif [[ ( "$theme" == *'type-2'* ) || ( "$theme" == *'type-4'* ) ]]; then
        list_col='4'
        list_row='1'
        win_width='550px'
    fi

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
    chosen=$(echo -e "$option_1\n$option_2\n$option_3\n$option_4" | rofi_cmd $lastPick)
    
    # Handle the case when `Esc` is pressed (which sets `chosen` to an empty string)
    if [[ -z "$chosen" ]]; then
        break
    fi

    # Execute the chosen command
    run_cmd "$chosen"
done

