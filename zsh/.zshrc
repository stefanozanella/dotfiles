## Hook in chruby
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

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

## ls and grep colors
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

export GREP_COLOR='1;32'
export GREP_OPTIONS=--color=auto

## Keybinding
bindkey -e
bindkey '\e[3~' delete-char
bindkey '^R' history-incremental-search-backward
# TODO: forward search, move between words, set word separators

## Prompt
autoload -U promptinit colors
promptinit
colors
setopt prompt_subst

__last_exit_status() {
  status_failure="%F{69}%{☁︎%G%}"
  status_success="%F{227}%{☀︎%G%}"

  echo "%(?.${status_success}.${status_failure})%f%b"
}

__ruby() { 
  version=$(chruby | grep '*' | tr -d '* ' | sed 's/ruby-//')
  echo "%F{161}${version:-system}%f" 
}

__git_branch() {
  ref=$(git symbolic-ref --short HEAD 2> /dev/null)

  if [[ $ref == "master" ]]; then
    color=118
  else
    color=33
  fi

  if [ -z "$ref" ]; then
    ref=$(git reflog 2> /dev/null | grep checkout | head -n1 | awk '{print $NF}')
    color=202
  fi

  if [ -z "$ref" ]; then
    ref="not git"
    color=234
  fi

  echo "%F{$color}%15>…>${ref}%<<%f"
}

__git_status() {
  index=$(git status --porcelain 2> /dev/null)

  if [ $? -eq 0 ]; then
    edit_color=46
    staging_color=46

    if $(echo "$index" | grep '^?? ' &> /dev/null); then
      edit_color=196
      staging_color=202
    elif $(echo "$index" | grep '^\s*[MA] ' &> /dev/null); then
      edit_color=202

      if $(echo "$index" | grep '^ [MA] ' &> /dev/null); then
        staging_color=202
      fi
    fi
  else
    edit_color=234
    staging_color=234
  fi

  echo "%F{$staging_color}%{✈︎%G%}%f %F{236}∙%f %F{$edit_color}•%f"
}

RPROMPT=' $(__ruby) %F{236}∙%f $(__last_exit_status)'
PROMPT='$(__git_status) %F{236}∙%f $(__git_branch) %F{236}∙%f %F{195}%~ %{⇢%G%}%f  '

export GOPATH=~/code/go
export PATH=$PATH:$GOPATH/bin

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
