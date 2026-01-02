source "$HOME/.dots/.zim_config"

export EDITOR=nvim
export SUDO_EDITOR=nvim
export PAGER=less
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export SUDO_PROMPT='Pass: 󰌆 '
export PATH="$HOME/.local/bin:$PATH"

export WORDCHARS=${WORDCHARS//[\/]}
export WORDCHARS=${WORDCHARS//-}

# Rust
export CARGO_HOME="$HOME/.local/share/cargo"
export PATH="$CARGO_HOME/bin:$PATH"

# JS
export NPM_HOME="$HOME/.local/share/npm"
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$NPM_HOME/bin:$PNPM_HOME:$PATH"

# Go
export GOPATH="$HOME/.local/share/go"
export PATH="$PATH:$GOPATH/bin"

# FZF
export FZF_DEFAULT_OPTS="\
  --ansi\
  --color=bg+:0,bg:-1\
  --color=fg:8,fg+:15,hl:15,hl+:3,marker:3\
  --color=prompt:4,pointer:4,spinner:5\
  --color=header:1,info:4,border:0,gutter:0\
  --prompt=' '\
  --preview-window='sharp'\
"

source $HOME/.dots/fzf/key-bindings.zsh

# Extra
source $HOME/.dots/alias.sh

autoload "$(rip completion zsh)"
eval "$(fnm env --use-on-cd --shell zsh)"
eval "$(starship init zsh)"
