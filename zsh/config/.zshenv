# ~/.zshenv

mkdir -p $HOME/dotfiles/zsh/{config,history,completions}

export DOTDIR="$HOME/dotfiles"
export ZDOTDIR="$DOTDIR/zsh/config"
export ZSH="$DOTDIR/zsh/.oh-my-zsh"
export HISTFILE="$DOTDIR/zsh/history/.zsh_history"
export ZSH_COMPDUMP="$DOTDIR/zsh/completions/.zcompdump"
. "$HOME/.cargo/env"
