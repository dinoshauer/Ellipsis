#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
