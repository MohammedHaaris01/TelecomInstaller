#!/bin/bash
set -e
exec > >(tee -i install_srsRAN_4G.log)
exec 2>&1

echo "================== Installing srsRAN_4G =================="

USER_HOME="${SUDO_USER_HOME:-${HOME}}"
if [ "$SUDO_USER" ]; then
    USER_HOME="/home/$SUDO_USER"
fi

cd "$USER_HOME"
if [ ! -d "srsRAN_4G" ]; then
    git clone https://github.com/srsRAN/srsRAN_4G.git
fi

cd "$USER_HOME/srsRAN_4G"
mkdir -p build
cd build
cmake ../
make -j$(nproc)
make install
srsran_install_configs.sh service
ldconfig -user

echo "================== srsRAN_4G Installation Complete =================="

