FROM kalilinux/kali-rolling

RUN apt update && apt install -y \
    kali-desktop-xfce \
    tightvncserver \
    wget \
    novnc \
    websockify \
    xterm \
    xfce4-terminal \
    && apt clean

RUN mkdir -p /root/.vnc && \
    echo "ChangeYourPasswordHere" | vncpasswd -f > /root/.vnc/passwd && \
    chmod 600 /root/.vnc/passwd

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 6080

CMD ["/start.sh"]
