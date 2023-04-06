alias sudo="sudo " # allow alias in sudo
alias df="df -h"
alias du="du -h"
alias chmod='chmod --preserve-root -v'
alias chown='chown --preserve-root -v'
alias py=python3

# files and directories manipulation
alias mkdir="mkdir -p"
alias cp="cp -r"
alias rm="rm -rI"

# npm run for lazy people (me)
alias nrun="npm run"

# git/github
alias lg=lazygit
alias gui=gitui
alias gc="cz"
alias gii="git init"
alias gcma="git commit --amend --no-edit"

# vim
alias hl=helix
alias vim=nvim
alias v=nvim
alias vima="nvim ~/.dotfiles/alias.sh"
alias vimc="nvim ~/.config/nvim/init.lua -c cd%:p:h"
alias zshc="nvim ~/.zshrc"

# exa
alias ls="exa --group-directories-first --icons" # show
alias la="ls -a"                                 # show (hidden)
alias l="ls -lhg --git"                         # list mode
alias ll="l -a"                                  # list (hidden)
alias lt="ls -TI .git\|node_modules"             # tree
alias lta="lt -a"                                # tree (hidden)

# create and go to dicectory
mcd() {
  mkdir -p "$1"
  cd "$1" || exit
}

# create python virtual environment and go to it
pyenv() {
  if [ ! -d '.venv' ]; then
    echo "Creating virtual environment..."
    python3 -m venv .venv
  fi

  source .venv/bin/activate
}

# fancy diff
fdiff() {
  diff -u "$@" | diff-so-fancy
}

# calculator
calc() {
  printf "%s\n" "$@" | bc -l;
}

export aliases[=]=calc
