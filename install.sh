DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
OS="$(uname -s)"

install_packages() {
    packages=("zsh" "ripgrep" "fd" "btop" "eza" "fzf" "gitui" "lazygit" "glow" "git" "starship" "wget" "lf" "git-delta" "dust" "neovim")

    install_arch() {
        sudo sed -i 's/^#Color$/Color/' /etc/pacman.conf
        sudo sed -i 's/^#VerbosePkgLists$/VerbosePkgLists/' /etc/pacman.conf

        sudo pacman -Syu

        # paru
        if ! command -v paru &> /dev/null; then
            echo "Installing paru..."
            git clone https://aur.archlinux.org/paru.git
            cd paru
            makepkg -si
            cd ..
            rm -rf paru
        fi

        local_packages=("github-cli" "unzip" "tar")
        sudo paru -S --needed "${packages[@]}" "${local_packages[@]}"
    }

    install_macos() {
        if ! command -v brew &> /dev/null; then
            echo "Installing Homebrew..."
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        fi

        local_packages=("gh")
        brew update
        brew install "${packages[@]}" "${local_packages[@]}"
    }

    if [ "$OS" == "Darwin" ]; then
        install_macos
    elif [ "$OS" == "Linux" && -f /etc/arch-release ]; then
        install_arch
    else
        echo "Not supported OS. Skipping system package installation."
    fi
}

setup_zim() {
    echo "Installing zimfw..."
    curl -fsSL "https://raw.githubusercontent.com/zimfw/install/master/install.zsh" | zsh
    echo "zmodule fzf" >> ~/.zimrc
    zsh
    zimfw install
    chsh -s $(which zsh)
}

setup_git() {
    echo "Configuring git..."
    read -p "Git user.name -> " git_name
    read -p "Git user.email -> " git_email

    git config --global user.name "$git_name"
    git config --global user.email "$git_email"
    git config --global init.defaultBranch "main"
    git config --global pull.rebase true
    # git-delta config
    git config --global core.pager delta
    git config --global interactive.diffFilter delta --color-only
    git config --global delta.navigate true
    git config --global merge.conflictStyle zdiff3
}

setup_configs() {
    echo "Linking configs..."

    for dir in $DIR/*; do
        [[ -d "$dir" ]] || continue

        name="$(basename "$path")"
        rm -rf $HOME/.config/$name
        ln -sf $DIR/$name $HOME/.config/
    done

    ln -sf $DIR/starship.toml $HOME/.config/starship.toml
    ln -sf $DIR/.zshrc $HOME
}

install_packages()
setup_zim
setup_git
setup_configs
