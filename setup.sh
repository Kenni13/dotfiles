#!/bin/sh

# if [ -d "$HOME/dotfiles" ]; then
#   echo "dotfiles folder exists"
#   ln -sf "$HOME/dotfiles/nvim" "$HOME/.config/nvim"
#   ln -sf "$HOME/dotfiles/zsh" "$HOME/.zshrc"
# else
#   echo "dotfiles folder not found!"
# fi

if [ ! -d "$HOME/.config" ]; then
  mkdir -p "$HOME/.config"
fi

if [ ! -d "$HOME/dotfiles" ]; then
  echo "Error: dotfiles folder not found!" >&2
  exit 1
fi

if [ ! -d "$HOME/dotfiles/clangd" ]; then
  echo "Error: clangd folder not found" >&2
  exit 1
fi
if [ ! -d "$HOME/dotfiles/nvim" ]; then
  echo "Error: nvim folder not found" >&2
  exit 1
fi
if [ ! -d "$HOME/dotfiles/starship" ]; then
  echo "Error: starship folder not found" >&2
  exit 1
fi
if [ ! -d "$HOME/dotfiles/ssh" ]; then
  echo "Error: ssh folder not found" >&2
  exit 1
fi

if [ -d "$HOME/.config/clangd" ]; then
  echo "clangd configurations already exists in $HOME/.config/clangd"
else
  ln -sfv "$HOME/dotfiles/clangd" "$HOME/.config/clangd"
fi

if [ -d "$HOME/.config/nvim" ]; then
  echo "neovim configurations already exists in $HOME/.config/nvim"
else
  ln -sfv "$HOME/dotfiles/nvim" "$HOME/.config/nvim"
fi

if [ -d "$HOME/.config/starship" ]; then
  echo "starship configurations already exists in $HOME/.config/starship"
else
  ln -sfv "$HOME/dotfiles/starship" "$HOME/.config/starship"
fi

if [ -f "$HOME/.zshenv" ]; then
  echo "zshenv file already exists at $HOME/.zshenv"
else
  ln -sfv "$HOME/dotfiles/zsh/config/.zshenv" "$HOME/.zshenv"
fi

if [ -d "$HOME/.ssh" ]; then
  echo "ssh configurations already exists in $HOME/.ssh"
else
  ln -sfv "$HOME/dotfiles/ssh" "$HOME/.ssh"
fi






