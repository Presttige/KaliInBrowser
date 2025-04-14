FROM kalilinux/kali-last-release

# Install XFCE Desktop + VNC + noVNC
RUN apt update && apt install -y \
    kali-desktop-xfce \
    tightvncserver \
    wget \
    novnc \
    websockify \
    xterm \
    xfce4-terminal \
    && apt clean

# Set up VNC password
RUN mkdir -p /root/.vnc && \
    echo "ChangeYourPassword" | vncpasswd -f > /root/.vnc/passwd && \
    chmod 600 /root/.vnc/passwd

# Copy and prepare start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 6080
ENV USER=root
CMD ["/start.sh"]
