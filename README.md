# KaliInBrowser
Run a full Kali Linux desktop environment with XFCE in your browser using Docker and noVNC.
---

## 📦 Features

- Kali Linux with XFCE Desktop
- Accessible via browser (noVNC)
- Network-independent (runs in Docker)
- Shared volume for persistent data
- Easy to rebuild with your own VNC password

---

## 🚀 Getting Started

### 1. Clone this Repository

```bash
git clone https://github.com/yourusername/kali-linux-docker-gui.git
cd kali-linux-docker-gui
```
### 2. Customize Your VNC Password (Important)
In the Dockerfile, find this section:

```bash
RUN mkdir -p /root/.vnc && \
    echo "ChangeYourPasswordHere" | vncpasswd -f > /root/.vnc/passwd && \
    chmod 600 /root/.vnc/passwd
🔐 Replace ChangeYourPasswordHere with your own secure VNC password.
```

### 3. Build and Run with Docker Compose
```bash
sudo docker-compose up --build -d
```
This will:
- Build the Docker image
- Start the Kali GUI container in the background
- Map it to port 6080 on your host machine

### 🌐 Access the Kali Desktop
Open your browser and go to:
```bash
http://<your-host-ip>:6080/vnc.html
```
Replace <your-host-ip> with your Ubuntu/Docker host IP (e.g. 192.168.1.100).
You’ll be prompted to enter the VNC password you defined earlier.

### 🗂 Shared Folder
A shared folder is mounted inside the container at:
```bash
/root/data
```
Anything you place in ./data (in your project directory) will persist and sync across rebuilds.

### 🛑 Stop the Container:

```bash
sudo docker-compose down
This stops and removes the container but keeps your image and volumes.
```

### 🛠 Troubleshooting
Can’t access from another PC? Make sure Docker is binding to 0.0.0.0 (which it is by default with this setup).
Firewall issues? Try sudo ufw allow 6080/tcp.
GUI not showing up? Ensure VNC server and websockify are running — try rebuilding the image.

📌 Notes
This setup is intended for development, learning, and testing.
It does not provide hardware access, so some Kali tools (e.g., Wi-Fi hacking) won't work properly. Use a VM or physical install for full access.


