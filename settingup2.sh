#!/bin/zsh

# install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# clean
mv -f zshrc_backup .zshrc
rm settingup2.sh

echo "done restart and enjoy!"
