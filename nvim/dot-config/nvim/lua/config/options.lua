-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Some changes from https://www.lazyvim.org/configuration/general
local opt = vim.opt

-- other options
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.local/share/undodir"

-- try to fix julia indenting
vim.g.julia_intent_align_brackets = 0
vim.g.julia_intent_align_funcargs = 0


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
