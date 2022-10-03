#
# ~/.bash_profile
#

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_PICTURES_DIR="$HOME/Pictures/screenshots"
export XDG_CURRENT_DESKTOP="sway"
export XDG_SESSION_TYPE="wayland"
export QT_QPA_PLATFORM="wayland"
export QT_STYLE_OVERRIDE="kvantum"


[[ -f ~/.bashrc ]] && . ~/.bashrc
