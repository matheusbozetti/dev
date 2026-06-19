
#---------- XDG base directories ----------
# Centralizes config/cache/data locations
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# ---------- Editor ----------
# Default editor used by git, crontab, etc.
export EDITOR="nvim"
export VISUAL="nvim"

export BAT_PAGER="less -RFX"

# ---------- Pager ----------
if command -v bat >/dev/null 2>&1; then
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
elif command -v batcat >/dev/null 2>&1; then
  export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
fi

# ---------- GPG ----------
export GPG_TTY=$(tty)

# ---------- Starship ----------
export STARSHIP_CONFIG="${ZDOTDIR:-$HOME/.config/zsh}/starship.toml"

[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
