#!/usr/bin/env zsh
source "$XDG_CONFIG_HOME/zsh/aliases"

setopt AUTO_PARAM_SLASH
unsetopt CASE_GLOB

autoload -Uz compinit; compinit
#Autocomplete hidden files
_comp_options+=(globdots)
source ~/dotfiles/zsh/external/completion.zsh

fpath=($ZDOTDIR/external $fpath)

autoload -Uz prompt_purification_setup; prompt_purification_setup

# Push the current directory visited onto the stack
setopt AUTO_PUSHD
# Do not store duplicate directories in the stack
setopt PUSHD_IGNORE_DUPS
# Do not print the directory stack after using pushd or popd
setopt PUSHD_SILENT

bindkey -v 
export KEYTIMEOUT=1

autoload -Uz cursor_mode && cursor_mode

# bindings to align with tmux config
bindkey -r '^l'
bindkey -r '^u'
bindkey -s '^u' 'clear\n'

# vim mapping for completion
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# editing commands in neovim 
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-commmand-line

source ~/dotfiles/zsh/external/bd.zsh

source $DOTFILES/zsh/scripts.sh
ftmuxp

if [ $(command -v "fzf") ]; then
    source /usr/share/fzf/completion.zsh
    source /usr/share/fzf/key-bindings.zsh
fi

# Change this to not autostart on tty2
if [ "$(tty)" = "/dev/tty2" ];
then
    pgrep i3 || exec startx "$XDG_CONFIG_HOME/X11/.xinitrc"
fi
[ -f "/home/n/.ghcup/env" ] && . "/home/n/.ghcup/env" # ghcup-env

###################################################################
#Needs to be sourced last so everything else needs to be above ^^^#
###################################################################
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
