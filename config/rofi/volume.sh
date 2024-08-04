#!/usr/bin/env bash

## Author  : Aditya Shakya (adi1090x)
## Github  : @adi1090x
#
## Applets : Volume
#
# Custom modifications by @Azpect3120

# Import Current Theme
theme="$HOME/.dotfiles/config/rofi/themes/volume.rasi"

# Speaker and mic information
SPEAKER_SINK_NAME=$(pactl info | awk '/^Default Sink:/ {print $3}')
MIC_SINK_NAME=$(pactl info | awk '/^Default Source:/ {print $3}')
SPEAKER_MUTE=$(pactl get-sink-mute $SPEAKER_SINK_NAME | awk '{print $2}')
MIC_MUTE=$(pactl get-source-mute $MIC_SINK_NAME | awk '{print $2}')

# Speaker volume
SPEAKER_VOL_LEFT=$(pactl get-sink-volume $SPEAKER_SINK_NAME | awk '{print $5}')
SPEAKER_VOL_RIGHT=$(pactl get-sink-volume $SPEAKER_SINK_NAME | awk '{print $12}')

active=""
urgent=""

# Speaker Info
if [[ "$SPEAKER_MUTE" == "yes" ]]; then
    stext='Mute'
    sicon=''
    urgent="-u 1"
else
    stext='Unmute'
    active="-a 1"
    sicon=''
fi

# Microphone Info
if [[ "$MIC_MUTE" == "yes" ]]; then
  [ -n "$urgent" ] && urgent+=",3" || urgent="-u 3"
    mtext='Mute'
    micon=''
else
  [ -n "$active" ] && active+=",3" || active="-a 3"
    mtext='Unmute'
    micon=''
fi


# Theme Elements
prompt="Audio Control"
mesg=""

# Listview
list_col='1'
list_row='5'
win_width='100px'

# Options
option_1=""
option_2="$sicon"
option_3=""
option_4="$micon"
option_5=""

# Rofi CMD
rofi_cmd() {
	rofi -theme-str "window {width: $win_width;}" \
		-theme-str "listview {columns: $list_col; lines: $list_row;}" \
    -theme-str "textbox-prompt-colon {str: \"$SPEAKER_VOL_LEFT/$SPEAKER_VOL_RIGHT\";}" \
		-dmenu \
		-p "$prompt" \
    ${active} ${urgent} \
		-markup-rows \
		-theme ${theme}
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$option_1\n$option_2\n$option_3\n$option_4\n$option_5" | rofi_cmd
}

# Execute Command
run_cmd() {
	if [[ "$1" == '--opt1' ]]; then
    pactl set-sink-volume $SPEAKER_SINK_NAME +10%
	elif [[ "$1" == '--opt2' ]]; then
    pactl set-sink-mute $SPEAKER_SINK_NAME toggle
	elif [[ "$1" == '--opt3' ]]; then
    pactl set-sink-volume $SPEAKER_SINK_NAME -10%
	elif [[ "$1" == '--opt4' ]]; then
    pactl set-source-mute $MIC_SINK_NAME toggle
	elif [[ "$1" == '--opt5' ]]; then
		pavucontrol
	fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $option_1)
		run_cmd --opt1
        ;;
    $option_2)
		run_cmd --opt2
        ;;
    $option_3)
		run_cmd --opt3
        ;;
    $option_4)
		run_cmd --opt4
        ;;
    $option_5)
		run_cmd --opt5
        ;;
esac
