#!/usr/bin/env bash

SINK_NAME=$(pactl info | awk '/^Default Sink:/ {print $3}')

# case "$1" in
#     mute)
#         pactl set-sink-mute $SINK_NAME 1
#         echo "Muted $SINK_NAME"
#         ;;
#     unmute)
#         pactl set-sink-mute $SINK_NAME 0
#         echo "Unmuted $SINK_NAME"
#         ;;
#     volume)
#         if [[ -z "$2" ]]; then
#             echo "Please specify the volume level (e.g., 50% or +10% or -10%)"
#         else
#             pactl set-sink-volume $SINK_NAME $2
#             echo "Set volume of $SINK_NAME to $2"
#         fi
#         ;;
#     *)
#         echo "Usage: $0 {mute|unmute|volume [level]}"
#         exit 1
#         ;;
# esac

SPEAKER_SINK_NAME=$(pactl info | awk '/^Default Sink:/ {print $3}')
MIC_SINK_NAME=$(pactl info | awk '/^Default Source:/ {print $3}')

echo "SPEAKER_SINK_NAME: $SPEAKER_SINK_NAME"
echo "MIC_SINK_NAME: $MIC_SINK_NAME"
