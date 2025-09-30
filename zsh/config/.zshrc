# Path to your Oh My Zsh installation.
# export ZSH="$HOME/.oh-my-zsh"

# ZSH configs
HISTSIZE=5000
#HISTFILE=~/.zsh_history #set in .zshenv
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"


export STARSHIP_CONFIG=~/.config/starship/starship.toml
export STARSHIP_CACHE=~/.config/starship/cache
export EDITOR='nvim'


# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting command-not-found)

source $ZSH/oh-my-zsh.sh

# User configuration

alias copy='wl-copy'
alias paste='wl-paste'
alias tree='ls --tree'
alias ls='eza --color=always --icons=always --group-directories-first --sort=extension'
alias cd='z'
alias open='xdg-open'


function zfzf() {
  local dir
  dir=$(fd --type d | fzf)
  if [ -n "$dir" ]; then
    z "$dir"
  fi
}

. "$HOME/.local/bin/env"
