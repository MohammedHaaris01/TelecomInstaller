#!/bin/bash
set -e
exec > >(tee -i install_open5gs.log)
exec 2>&1

echo "================== Installing Open5GS + MongoDB + Node.js =================="

USER_HOME="${SUDO_USER_HOME:-${HOME}}"
if [ "$SUDO_USER" ]; then
    USER_HOME="/home/$SUDO_USER"
fi

# MongoDB
echo "[1/3] Installing MongoDB..."
curl -fsSL https://pgp.mongodb.com/server-8.0.asc | gpg -o /usr/share/keyrings/mongodb-server-8.0.gpg --dearmor
echo "deb [arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-8.0.gpg] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/8.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-8.0.list
apt update -y
apt install -y mongodb-org
systemctl enable mongod
systemctl start mongod

# Node.js 20
echo "[2/3] Installing Node.js..."
mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
NODE_MAJOR=20
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
apt update -y
apt install -y nodejs

# Open5GS WebUI
echo "[3/3] Installing Open5GS WebUI..."
curl -fsSL https://open5gs.org/open5gs/assets/webui/install | bash -

echo "================== Open5GS Installation Complete =================="

