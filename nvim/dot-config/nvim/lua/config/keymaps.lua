-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("n", "<leader>d", '"_d', { desc = "Delete without yank" })
map("v", "<leader>d", '"_d', { desc = "Delete without yank" })

map("n", "<leader>p", '"_p', { desc = "Paste without yank" })
map("v", "<leader>p", '"_p', { desc = "Paste without yank" })

map("n", "<leader>C", '"_c', { desc = "Change without yank" })
map("v", "<leader>C", '"_c', { desc = "Change without yank" })

-- Escape even without zsa
map("i", "jk", "<ESC>", {silent = true})
map("v", "jk", "<ESC>", {silent = true})
