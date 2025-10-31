-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.lsp.config("jetls", {
  cmd = {
    "julia",
    "--startup-file=no",
    "--history-file=no",
    "--project=/home/kevin/.julia/environments/jetls/",
    "--threads=auto",
    "/home/kevin/.julia/dev/JETLS/runserver.jl",
  },
  filetypes = { "julia" },
})
vim.lsp.enable("jetls")
