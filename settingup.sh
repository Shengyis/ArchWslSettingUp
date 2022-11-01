#!/bin/bash

# Enable systemd in wsl

touch /etc/wsl.conf
echo "[boot]" >> /etc/wsl.conf
echo "systemd=true" >> /etc/wsl.conf

echo "restart wsl and run settingup2.sh"
