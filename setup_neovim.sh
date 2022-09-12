# !/bin/sh
echo dirname $0
exit 0
cd dirname $0

echo -n "This will overwrite current configs from neovim. Continue [Y\n]? "
read yn
case $yn in
    n | N )
    echo "Aborting!"
    exit 0
    * )
    echo -e "Moving from ./nvim to ~/.config/nvim\n"
    cp -r ./nvim/* ~/.config/nvim
esac
echo "Finished!"
exit 0
