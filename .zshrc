#!/usr/bin/env zsh
source "$XDG_CONFIG_HOME/zsh/aliases"

export VISUAL=nvim
export EDITOR=nvim

setopt AUTO_PARAM_SLASH
unsetopt CASE_GLOB

autoload -Uz compinit; compinit

#Autocomplete hidden files
_comp_options+=(globdots)
source ~/.dotfiles/zsh/external/completion.zsh

fpath=($ZDOTDIR/external $fpath)

autoload -Uz prompt_purification_setup; prompt_purification_setup

source ~/.dotfiles/zsh/scripts.sh
ftmuxp

if [ $(command -v "fzf") ]; then
    source /usr/share/fzf/completion.zsh
    source /usr/share/fzf/key-bindings.zsh
fi

if [ "$(tty)" = "/dev/tty1" ];
then
    pgrep i3 || exec startx &>/dev/null "$XDG_CONFIG_HOME/X11/.xinitrc"
fi

[ -f "/home/n/.ghcup/env" ] && . "/home/n/.ghcup/env" # ghcup-env

export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
export PATH=$JAVA_HOME/bin:$PATH


###################################################################
#Needs to be sourced last so everything else needs to be above ^^^#
###################################################################
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
