#!/bin/bash

# Enable systemd in wsl
curl -L -O "https://raw.githubusercontent.com/nullpo-head/wsl-distrod/main/install.sh"
chmod +x install.sh
./install.sh install
./install.sh update
/opt/distrod/bin/distrod enable

echo "restart and run settingup2.sh"