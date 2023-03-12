#!/bin/sh

cd "$(dirname "$0")"

# Download main dotfiles
git submodule update --init --recursive

# Link things
ln -s -f "$(pwd)/.dotfiles/.config/nvim" /home/gitpod/.config/nvim
ln -s -f "$(pwd)/.dotfiles/.config/fish" /home/gitpod/.config/fish
ln -s -f "$(pwd)/.dotfiles/.tmux.conf" /home/gitpod/.tmux.conf
ln -s -f "$(pwd)/.dotfiles/.tmux.conf.local" /home/gitpod/.tmux.conf.local

# Install neovim
cd $(mktemp -d)

URL="https://github.com/neovim/neovim/releases/latest/download/nvim.appimage"
if test -n "$NEOVIM_VERSION"
then
    URL="https://github.com/neovim/neovim/releases/download/$NEOVIM_VERSION/nvim.appimage"
fi

curl -LO "$URL"
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract >/dev/null
mkdir -p /home/gitpod/.local/bin
ln -s -f $(pwd)/squashfs-root/AppRun /home/gitpod/.local/bin/nvim

