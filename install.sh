# NOTE:
# - This only install/configure terminal stuff
# - It assumes you're using Arch derived

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

sudo sed -i 's/^#Color$/Color/' /etc/pacman.conf
sudo sed -i 's/^#VerbosePkgLists$/VerbosePkgLists/' /etc/pacman.conf

sudo pacman -Syu

utils=("zsh" "bat" "ripgrep" "fd" "btop" "exa" "fzf" "gitui" "lazygit" "glow" "git" "github-cli" "starship" "unzip" "tar" "wget" "unzip")
sudo pacman -S --needed base-devel "${utils[@]}"

sudo chsh -s /bin/zsh

### zim
curl -fsSL "https://raw.githubusercontent.com/zimfw/install/master/install.zsh" | zsh
echo "zmodule fzf" >> ~/.zimrc
zsh
zimfw install

### languages
langs=("rustup" "luajit" "nodejs" "npm" "deno" "go" "python-pip")
sudo pacman -S --needed base-devel "${langs[@]}"

# node
NPM_HOME="$HOME/.local/share/npm"
PATH="$NPM_HOME/bin:$PATH"
node_pkgs=("npm" "pnpm" "yarn" "tldr" "typescript" "prettier" "czg")

npm set prefix "$NPM_HOME"
npm i -g "${node_pkgs[@]}"
tldr --update

# bun
curl -fsSL https://bun.sh/install | bash

# rust
rustup default stable

### git
read -p "Git user.name -> " git_name
read -p "Git user.email -> " git_email

git config --global user.name "$git_name"
git config --global user.email "$git_email"
git config --global init.defaultBranch "main"

ln -sf $DIR/.czrc $HOME/

### nvim
wget -q "https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz"
tar -xf nvim-linux64.tar.gz
cd nvim-linux64
sudo mv bin/nvim /bin
sudo mv lib/nvim /lib
sudo cp -r share/* /usr/share
cd $DIR && rm -rf nvim-linux64*

### paru
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

### extra configs
configs=("btop" "helix" "kitty" "polybar" "wezterm" "leftwm" "gitui" "starship.toml")

for name in "${configs[@]}"; do
  rm -rI $HOME/.config/$name
  ln -sf $DIR/$name $HOME/.config/
done
