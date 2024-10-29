-- Basic nvim configuration
require("config.options")
require("config.basic-keymaps")

-- Get and setup lazy package manager
require("config.lazy")

-- Set color scheme
vim.cmd("colorscheme tokyonight")
--vim.cmd("colorscheme catppuccin")
