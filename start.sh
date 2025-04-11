#!/bin/bash

# Start the VNC server
vncserver :1 -geometry 1280x800 -depth 24

# Start noVNC (websockify + VNC viewer)
websockify --web=/usr/share/novnc/ 6080 localhost:5901
