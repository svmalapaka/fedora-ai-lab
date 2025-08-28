#!/bin/bash
# Fedora Server 42 Post-Install Setup — Sastry Malapaka

echo "🔧 Updating system..."
dnf update -y

echo "📦 Installing core tools..."
dnf install -y tmux htop git python3-pip ncdu podman cockpit

echo "🚀 Enabling services..."
systemctl enable --now cockpit.socket
systemctl enable --now sshd

echo "🌐 Opening firewall for JupyterLab..."
firewall-cmd --add-port=8888/tcp --permanent
firewall-cmd --reload

echo "🐍 Installing Python ML packages..."
pip3 install --upgrade pip
pip3 install pandas numpy matplotlib scikit-learn torch torchvision torchaudio

echo "📋 Logging system info..."
mkdir -p ~/fedora-ai-lab/logs
hostnamectl > ~/fedora-ai-lab/logs/system-info.txt
df -h >> ~/fedora-ai-lab/logs/system-info.txt
free -h >> ~/fedora-ai-lab/logs/system-info.txt

echo "✅ Setup complete. Ready to launch Podman container."

