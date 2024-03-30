#!/bin/bash

#
# This scripts downloads and installs starship cross-shell prompt
#
# NOTE: Script is made for Fedora and might not work on other distributions
#

source config/common-config.sh
source util/print-util.sh
source util/file-util.sh


#
# F U N C T I O N S   S E C T I O N
#

INSTALL_PATH="install-bash-addons"

command_exists () {
    command -v $1 >/dev/null 2>&1;
}

installDepend() {
    # Check for dependencies.
    print_info "Installing dependencies..."
    sudo pacman -S zoxide fzf bash-completion tar bat starship ttf-firacode-nerd 
}

installStarship() {
    if command_exists starship; then
        print_ok "Starship already installed"
        return
    fi

    if ! curl -sS https://starship.rs/install.sh|sh;then
        print_error "Something went wrong during starship install!"
        exit 1
    fi
}

installConfig() {
    # Create target directories if not already exist
    file_util_create_dir ${BASHRC_DIR}
    file_util_create_dir ${CONFIG_DIR}
   
    print_info "Copying config files (${INSTALL_PATH})..."
    \cp -a ${INSTALL_PATH}/.bashrc.d ${HOME}/
    \cp ${INSTALL_PATH}/starship.toml ${CONFIG_DIR}/
    \cp -f ${INSTALL_PATH}/.bashrc ~
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
installStarship
installConfig
configNerdFont

print_ok "Done!\nrestart your shell to see the changes."

