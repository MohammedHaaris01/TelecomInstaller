#!/bin/bash
set -e
exec > >(tee -i install_dependencies.log)
exec 2>&1

echo "================== Installing Dependencies =================="

# Detect original user's home if running with sudo
USER_HOME="${SUDO_USER_HOME:-${HOME}}"
if [ "$SUDO_USER" ]; then
    USER_HOME="/home/$SUDO_USER"
fi

# Update system and install build tools
echo "[1/6] Updating system and installing build tools..."
apt update -y && apt upgrade -y
apt install -y build-essential cmake gcc g++ pkg-config make git curl ca-certificates gnupg software-properties-common

# BladeRF
echo "[2/6] Installing BladeRF..."
apt install -y libbladerf-dev

# srsRAN dependencies
echo "[3/6] Installing srsRAN dependencies..."
apt install -y libfftw3-dev libmbedtls-dev libsctp-dev libyaml-cpp-dev \
               libboost-program-options-dev libconfig++-dev libgtest-dev \
               libzmq3-dev libpcsclite-dev doxygen intel-mkl ccache

# UHD (USRP driver)
echo "[4/6] Installing UHD (USRP driver)..."
add-apt-repository ppa:ettusresearch/uhd -y
apt update -y
apt install -y libuhd-dev uhd-host

# SoapySDR
echo "[5/6] Installing SoapySDR..."
apt install -y soapysdr-tools libsoapysdr-dev soapysdr-module-all

# WireShark
echo "[6/6] Installing Wireshark..."
apt install -y wireshark

echo "================== Dependencies Installation Complete =================="

