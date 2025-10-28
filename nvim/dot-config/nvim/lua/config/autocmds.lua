-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Autosave on exiting insert mode
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "update",
})

-- Autosave when cursor is inactive for a period of time (default 4 sec)
-- Change with `vim.opt.updatetime = {ms}`
vim.api.nvim_create_autocmd("CursorHold", {
  pattern = "*",
  command = "update",
})
