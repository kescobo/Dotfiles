return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- use latest release, remove to use latest commit
  cond = function()
    return vim.fn.isdirectory(vim.fn.expand("~/Obsidian")) == 1
  end,
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false, -- this will be removed in the next major release
    workspaces = {
      {
        name = "personal",
        path = "~/Obsidian/main",
      },
      {
        name = "work",
        path = "~/Obsidian/BonhamLab/",
      },
    },
  },
}
