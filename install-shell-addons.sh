#!/bin/bash

#
# This scripts downloads and installs starship cross-shell prompt
#
# NOTE: Script is made for Arch and might not work on other distributions
#

source config/common-config.sh
source util/print-util.sh
source util/file-util.sh


#
# F U N C T I O N S   S E C T I O N
#

INSTALL_PATH="$(pwd)/dotfiles"

command_exists () {
    command -v $1 >/dev/null 2>&1;
}

installDepend() {
    # Check for dependencies.
    print_info "Installing dependencies..."
    sudo pacman -S zoxide fzf bash-completion tar bat starship ttf-firacode-nerd stow eza fd fish
}

installConfig() {
    print_info "Sym linking config files in (${INSTALL_PATH})..."
    rm -rf ${HOME}/.config/nvim ${HOME}/.config/rvim ${HOME}/.config/starship.toml ${HOME}/.config/wezterm ${HOME}/.config/fish ${HOME}/.bashrc ${HOME}/.bashrc.d ${HOME}/.gitconfig
    rm -rf ${HOME}/.local/bin/*.sh
    stow -d ${INSTALL_PATH} -t ${HOME} nvim rvim wezterm bash fish starship git bin 
}

configNerdFont() {
    defaultProfile=$(gsettings get org.gnome.Terminal.ProfilesList default | cut -d "'" -f 2) 
    echo "Default=<$defaultProfile>"
    dconf write /org/gnome/terminal/legacy/profiles:/:$defaultProfile/font "'FiraCode Nerd Font 12'"
}

#
# M A I N   S E C T I O N
#

installDepend
installConfig
configNerdFont

print_ok "Done!\nrestart your shell to see the changes."

