#!/bin/bash

# clean
rm settingup3.sh
mv -f zshrc_backup .zshrc

# install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "done restart and enjoy!"
