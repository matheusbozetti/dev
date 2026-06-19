# =========================================================
# Keybindings
# =========================================================

# Cursor shape per vi mode
ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BEAM
ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK
ZVM_VISUAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK

# Disable command mode line highlight
ZVM_VI_HIGHLIGHT_BACKGROUND=none
ZVM_VI_HIGHLIGHT_FOREGROUND=none
ZVM_VI_HIGHLIGHT_EXTRASTYLE=none


# zsh-vi-mode resets all bindings on init, so custom bindings
# must be registered via this hook to survive.
zvm_after_init() {

    tmux_sessionizer_widget() {
        zle reset-prompt
        tmux-sessionizer
    }

    aws_connect_widget() {
        zle reset-prompt
        aws-ec2-connect
    }

    zle -N tmux_sessionizer_widget
    bindkey '^F' tmux_sessionizer_widget

    zle -N aws_connect_widget
    bindkey '^O' aws_connect_widget

  # Ctrl+Right -> move forward one word (^[[1;5C is the terminal escape code)
  bindkey '^[[1;5C' forward-word

  # Ctrl+Left -> move backward one word (^[[1;5D is the terminal escape code)
  bindkey '^[[1;5D' backward-word

  # Ctrl+G -> fzf file picker (no hidden files)
  bindkey '^G' _fzf_file_no_hidden

  # Ctrl+\ -> toggle autosuggestions (useful for screen recordings)
  bindkey '^\' autosuggest-toggle

  # Up/Down -> history search by substring (^[[A/^[[B are up/down arrow escape codes)
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down

  # Ctrl+R -> fzf history search (insert mode)
  bindkey '^R' fzf-history-widget
}

# vicmd/visual bindings are lazy-loaded by zsh-vi-mode, so they
# must be registered via this hook (zvm_after_init is too early).
zvm_after_lazy_keybindings() {
  bindkey -M vicmd '^R' fzf-history-widget
}

