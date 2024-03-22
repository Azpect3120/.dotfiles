#!/usr/bin/env bash
# ---------------------------------------------
# | Used to kill a window and end its process |
# | Built to kill firefox the RIGHT way       |
# ---------------------------------------------

# Get the window ID of the currently focused window
window_id=$(xdotool getactivewindow)

# Close the window
i3-msg [id="$window_id"] kill

# Get the process ID (PID) associated with the window
pid=$(xdotool getwindowpid "$window_id")

# Kill the process
kill -9 "$pid"
