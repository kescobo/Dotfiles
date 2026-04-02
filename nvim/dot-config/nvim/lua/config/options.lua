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

-- Copy over ssh
if vim.env.SSH_TTY then
  local osc52 = require("vim.ui.clipboard.osc52")

  local function copy_reg(reg)
    local orig = osc52.copy(reg)
    return function(lines, regtype)
      -- Write to Vim's internal register
      vim.fn.setreg(reg, table.concat(lines, "\n"), regtype)

      -- Send OSC52 to local clipboard
      orig(lines, regtype)
    end
  end

  vim.g.clipboard = {
    name = "OSC 52 with register sync",
    copy = {
      ["+"] = copy_reg("+"),
      ["*"] = copy_reg("*"),
    },
    -- Do NOT use OSC52 paste, just use internal registers
    paste = {
      ["+"] = function() return vim.fn.getreg('+'), 'v' end,
      ["*"] = function() return vim.fn.getreg('*'), 'v' end,
    },
  }

  vim.o.clipboard = "unnamedplus"
end
