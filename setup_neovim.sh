#!/bin/sh
cd "$(dirname "$0")" || exit 1

printf "This will overwrite current configs from neovim. Continue [Y\n]? "
read -r yn
case $yn in
    n | N )
    echo "Aborting!"
    exit 0
    ;;
    * )
    printf "Moving from ./nvim to ~/.config/nvim\n"
    cp -r -t "$HOME"/.config/nvim ./nvim/\{init.lua, lua, ftplugin\}
esac
echo "Finished!"
exit 0
