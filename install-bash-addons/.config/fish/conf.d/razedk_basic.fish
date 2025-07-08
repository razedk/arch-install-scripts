#!/bin/bash

set -gx PATH "$HOME/.local/bin:$PATH"

starship init fish | source
zoxide init fish | source
