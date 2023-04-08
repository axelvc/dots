# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

# Only current directory in termtitle
zstyle ':zim:termtitle' format '%~'

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
zstyle ':zim:git' aliases-prefix 'g'

# Append `../` to your input for each `.` you type after an initial `..`
zstyle ':zim:input' double-dot-expand yes

# Customize the style that the suggestions are shown with.
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=243'

# Set what highlighters will be used.
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets cursor)

# Disable automatic widget re-binding on each precmd.
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Initialize modules
ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi
# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
# Initialize modules.
source ${ZIM_HOME}/init.zsh

zmodload -F zsh/terminfo +p:terminfo

# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
for key ('^[[A' '^[k' ${terminfo[kcuu1]}) bindkey ${key} history-substring-search-up
for key ('^[[B' '^[j' ${terminfo[kcud1]}) bindkey ${key} history-substring-search-down
unset key

# Accept preview suggestion
bindkey '^ ' autosuggest-accept

# Open tab in same pwd on wsl
[[ -n "$WT_SESSION" ]] && {
  precmd() {
    printf "\e]9;9;%s\e\\" "$(wslpath -w "$PWD")"
  }
}

export EDITOR=nvim
export SUDO_EDITOR=nvim
export PAGER=less
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export SUDO_PROMPT='Password:  '
export PATH="$HOME/.local/bin:$PATH"

export WORDCHARS=${WORDCHARS//[\/]}
export WORDCHARS=${WORDCHARS//-}

# Rust
export CARGO_HOME="$HOME/.local/share/cargo"
export PATH="$CARGO_HOME/bin:$PATH"

# JS
export NPM_HOME="$HOME/.local/share/npm"
export PNPM_HOME="$HOME/.local/share/pnpm"
export BUN_INSTALL="$HOME/.local/share/bun"
export PATH="$NPM_HOME/bin:$PNPM_HOME:$BUN_INSTALL/bin:$PATH"

# Go
export GOPATH="$HOME/.local/share/go"
export PATH="$PATH:$GOPATH/bin"

# FZF
export FZF_DEFAULT_OPTS="\
  --ansi\
  --color=bg+:-1,bg:-1,spinner:3,hl:1\
  --color=fg:7,header:1,info:4,pointer:5\
  --color=marker:3,fg+:5,prompt:4,hl+:1"

source /usr/share/fzf/key-bindings.zsh

# Extra
source $HOME/.dots/alias.sh

unalias gh
eval "$(starship init zsh)"

