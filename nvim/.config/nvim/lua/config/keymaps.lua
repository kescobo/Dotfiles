-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local splits = require("smart-splits")

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

-- recommended mappings
-- resizing splits
-- these keymaps will also accept a range,
-- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
map("n", "<A-h>", splits.resize_left)
map("n", "<A-j>", splits.resize_down)
map("n", "<A-k>", splits.resize_up)
map("n", "<A-l>", splits.resize_right)
-- moving between splits
map("n", "<C-h>", splits.move_cursor_left)
map("n", "<C-j>", splits.move_cursor_down)
map("n", "<C-k>", splits.move_cursor_up)
map("n", "<C-l>", splits.move_cursor_right)
map("n", "<C-\\>", splits.move_cursor_previous)
-- swapping buffers between windows
map("n", "<leader><leader>h", splits.swap_buf_left)
map("n", "<leader><leader>j", splits.swap_buf_down)
map("n", "<leader><leader>k", splits.swap_buf_up)
map("n", "<leader><leader>l", splits.swap_buf_right)

map("v", "<leader>cs", ":SmuggleRange<CR>")

-- Escape even without zsa
map("i", "jk", "<ESC>", {silent = true})
map("v", "jk", "<ESC>", {silent = true})

