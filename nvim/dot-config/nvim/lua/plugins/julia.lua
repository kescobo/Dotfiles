return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- julials will be automatically installed with mason and loaded with lspconfig
        julials = {
          root_dir = function(fname)
            local util = require("lspconfig.util")
            return util.root_pattern("Project.toml")(fname)
              or vim.fs.dirname(vim.fs.find(".git", { path = fname, upward = true })[1])
              or vim.fs.dirname(fname)
          end,
        },
      },
    },
  },
}
