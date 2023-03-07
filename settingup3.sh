#!/bin/bash

# install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mv -f zshrc_backup .zshrc

# clean
rm settingup3.sh

echo "done restart and enjoy!"
