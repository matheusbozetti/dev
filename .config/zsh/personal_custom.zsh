export AWS_PROFILE=default

alias lg="lazygit"
alias ls="lsd"
alias du="dust"
alias k="kubectl"
alias ld="lazydocker"
alias p="cd ~/Projects/"
alias pn=pnpm
alias zr='source ~/.config/zsh/.zshrc'
alias devf='pnpm dev:frontend'
alias devb='pnpm dev:backend'
alias bp='pnpm build:packages'
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"

alias n='nvim .'

alias clearNodeModules="find ~/Projects -name 'node_modules' -type d -prune -print -exec rm -rf '{}' +"
alias clearLocalNodeModules="find . -name 'node_modules' -type d -prune -print -exec rm -rf '{}' +"
