#!/bin/bash
set -e
exec > >(tee -i install_srsGUI.log)
exec 2>&1

echo "================== Installing srsGUI =================="

USER_HOME="${SUDO_USER_HOME:-${HOME}}"
if [ "$SUDO_USER" ]; then
    USER_HOME="/home/$SUDO_USER"
fi

# Dependencies
echo "[1/2] Installing srsGUI dependencies..."
apt update -y && apt upgrade -y
apt install -y libboost-system-dev libboost-thread-dev libboost-test-dev \
               libqwt-qt5-dev qtbase5-dev qttools5-dev qttools5-dev-tools \
               libfftw3-dev cmake make libqt5svg5-dev libqt5serialport5-dev

# Clone and build
echo "[2/2] Cloning and building srsGUI..."
cd "$USER_HOME"
if [ ! -d "srsGUI" ]; then
    git clone https://github.com/srsLTE/srsGUI.git
fi
cd "$USER_HOME/srsGUI"
mkdir -p build
cd build
cmake -DCMAKE_BUILD_TYPE=Release ../
make -j$(nproc)
make install
ldconfig

echo "================== srsGUI Installation Complete =================="

