typeset -U path

path=(
  /opt/homebrew/bin
  /opt/homebrew/sbin
  /usr/local/bin
  /usr/bin
  /bin
  /usr/sbin
  /sbin
  $HOME/.local/bin
  $HOME/.local/scripts
  $HOME/.cargo/bin
  $path
)

export PATH

# Homebrew
if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# OrbStack
[ -f "$HOME/.orbstack/shell/init.zsh" ] && source "$HOME/.orbstack/shell/init.zsh"
