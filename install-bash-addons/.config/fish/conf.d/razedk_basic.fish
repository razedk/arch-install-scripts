set -gx PATH "$HOME/.local/bin:$PATH"

set -gx EDITOR "nvim" 
set -gx LIBVIRT_DEFAULT_URI "qemu:///system"

starship init fish | source
zoxide init fish | source
