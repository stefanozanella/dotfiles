## Hook in Boxen
source /opt/boxen/env.sh

## Eh...
alias vi='vim'
export EDITOR=vim

## History
HISTFILE=$HOME/.zsh_history
HISTSIZE=SAVEHIST=10000
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt inc_append_history
setopt share_history

## Changing directories
setopt auto_pushd
setopt pushd_ignore_dups

## Completion
autoload -U compinit
compinit

zstyle ':completion:*' special-dirs true
zstyle ':completion:*:*:*:*:*' menu select
