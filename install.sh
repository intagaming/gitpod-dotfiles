#!/bin/sh

cd "$(dirname "$0")"

# Download main dotfiles
git submodule update --init --recursive

# Shell
ln -s -f "$(pwd)/.dotfiles/.config/fish" /home/gitpod/.config/fish
curl -sS https://starship.rs/install.sh | sh -s -- -y

