#!/bin/bash

# function psearch-exact() {
#   pacman -Ss "^$1$"
# }

# Neovim distros
alias rvim 'nvim-distro.sh rvim'
alias jvim 'nvim-distro.sh jvim'
alias dvim 'nvim-distro.sh dvim'
alias avim 'nvim-distro.sh avim'

# Pacman
alias pup 'sudo pacman -Suy && paru -Suy'
# alias psearch-exact 'function _() { pacman -Ss "^$1$" }; _'
alias plist 'sudo pacman -Sup --print'
alias pin 'sudo pacman -S'
alias psearch 'pacman -Ss'
alias pse psearch
# alias psx psearch-exact
alias prm 'sudo pacman -Rns'

# GIT
alias gst 'git status'
alias gcm 'git commit -m'
alias gpu 'git push'
alias gad 'git add .'
#alias gst 'git status'
#alias gst 'git status'
#alias gst 'git status'

# Toolbox / Podman
alias te 'toolbox enter'
alias tc 'toolbox create'
alias podlist 'printf "$White$On_LightBlue$Bold\n::: Listing containers :::$Reset\n" && podman ps -a && printf "\n$White$On_Purple$Bold::: Listing images :::$Reset\n" && podman images && printf "\n"'
# alias podbash 'function _() { podman exec -it $1 /bin/bash; }; _'

# Commands
alias edit nvim
alias dir 'ls -lag --group-directories-first'
alias sdir 'sudo ls -lag --group-directories-first'
alias cls clear
alias show-grub-entries "sudo awk -F\\' '{ gsub(/^[ \t]+/,\"\", \$1); if (\$1 ==\"menuentry \") {print \$2 }}' /boot/grub2/grub.cfg"
alias whatismyip "hostname -I"

# Alias handling
alias edit-alias 'edit $HOME/.bashrc.d/razedk_aliases'
alias edit-prompt 'edit $HOME/.bashrc.d/razedk_prompt'
alias reload-alias '. $HOME/.bashrc.d/razedk_aliases'

# Change directory aliases
alias home 'cd ~'
alias cd.. 'cd ..'
alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'

# cd into the old directory
alias bd 'cd "$OLDPWD"'

# Remove a directory and all files
alias rmd '/bin/rm  --recursive --force --verbose '

# Alias's for multiple directory listing commands
alias ls eza # add colors and file type extensions

# alias chmod commands
alias mx 'chmod a+x'
alias 000 'chmod -R 000'
alias 644 'chmod -R 644'
alias 666 'chmod -R 666'
alias 755 'chmod -R 755'
alias 777 'chmod -R 777'

# Search command line history
alias h history
alias hg "history | grep "

# Search running processes
alias p "ps aux | grep "
alias topcpu "/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10"

# Show running services
alias ss-running "systemctl --type=service --state=running"
alias ss-failed "systemctl --type=service --state=failed"
alias ss-all "systemctl --type=service"

# Search files in the current folder
alias f "find . | grep "

# Count all files (recursively) in the current folder
# alias countfiles "for t in files links directories; do echo \`find . -type \${t:0:1} | wc -l\` \$t; done 2> /dev/null"

# To see if a command is aliased, a file, or a built-in command
alias checkcommand "type -t"

# Show open ports
alias openports 'netstat -nape --inet'

# Alias's for safe and forced reboots
alias rebootsafe 'sudo shutdown -r now'
alias rebootforce 'sudo shutdown -r -n now'

# Alias's for shutdown
alias shut 'sudo shutdown now'

# Alias's to show disk space and space used in a folder
alias diskspace "du -S | sort -n -r |more"
alias folders 'du -h --max-depth=1'
alias folderssort 'find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'
alias tree 'tree -CAhF --dirsfirst'
alias treed 'tree -CAFd'
alias mountedinfo 'df -hT'
