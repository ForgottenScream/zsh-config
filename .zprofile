#
# ~/.zprofile
#

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx &>/dev/null
fi

# Source ~/.zshrc if it exists
[[ -f ~/.zshrc ]] && source ~/.zshrc
