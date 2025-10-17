#!/bin/bash
set -e
exec > >(tee -i install_srsRAN_Project.log)
exec 2>&1

echo "================== Installing srsRAN_Project =================="

USER_HOME="${SUDO_USER_HOME:-${HOME}}"
if [ "$SUDO_USER" ]; then
    USER_HOME="/home/$SUDO_USER"
fi

cd "$USER_HOME"
if [ ! -d "srsRAN_Project" ]; then
    git clone https://github.com/srsRAN/srsRAN_Project.git
fi

cd "$USER_HOME/srsRAN_Project"
mkdir -p build
cd build
cmake ../
make -j$(nproc)
make install
ldconfig

echo "================== srsRAN_Project Installation Complete =================="

