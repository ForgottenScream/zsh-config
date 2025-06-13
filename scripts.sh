!/usr/bin/env zsh

ftmuxp() {
    if [[ -n $TMUX ]]; then
        return
    fi

    # get the IDs
    ID="$(ls $HOME/.config/tmuxp | sed -e 's/\.yml$//')"
    if [[ -z "$ID" ]]; then
        tmux new-session
    fi

    create_new_session="Create New Session"

    ID="${create_new_session}\n$ID"
    ID="$(echo $ID | fzf | cut -d: -f1)"

    if  [[ "$ID" = "${create_new_session}" ]]; then
        tmux new-session

    elif [[ -n "$ID" ]]; then
        tmuxp load "$ID"
    fi
}
