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
alias npi="npm i"
alias nps="npm start"
alias npd="npm run dev"

# git/github
alias lg=lazygit
alias gui="gitui -t $HOME/.dots/gitui/theme.ron"
alias gc="czg"
alias gii="git init"
alias gcma="git commit --amend --no-edit"

# vim
alias hl=helix
alias vim=nvim
alias v=nvim
alias vima="nvim ~/.dots/alias.sh"
alias vimc="nvim ~/.config/nvim/init.lua -c cd%:p:h"
alias zshc="nvim ~/.zshrc"

# eza
alias ls="eza --group-directories-first --icons" # show
alias la="ls -a"                                 # show (hidden)
alias l="ls -lhg --git"                          # list
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

function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

export aliases[=]=calc
