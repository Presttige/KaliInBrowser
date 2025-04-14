#!/bin/bash

export USER=root
export DISPLAY=:1

# Clean old lock files
rm -rf /tmp/.X*-lock /tmp/.X11-unix/X*

# Kill any old sessions
pkill Xtightvnc || true
pkill websockify || true

# Start VNC
vncserver :1 -geometry 1280x800 -depth 24


# Start noVNC (websockify + VNC viewer)
websockify --web=/usr/share/novnc/ 6080 localhost:5901

