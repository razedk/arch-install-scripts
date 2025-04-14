-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set -- for conciseness

map("n", "<C-q>", ":q<CR>", { desc = "Quit current window/buffer" })
map("n", "<C-PageUp>", ":BufferLineCyclePrev<CR>", { desc = "Go to previous tab" })
map("n", "<C-PageDown>", ":BufferLineCycleNext<CR>", { desc = "Go to next tab" })
