-- https://github.com/Myriad-Dreamin/tinymist/blob/main/editors/neovim/README.md#working-with-multiple-files-projects
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "tinymist" },
    })

    local lspconfig = require("lspconfig")

    lspconfig.tinymist.setup({
      on_attach = function(client, bufnr)
        vim.keymap.set("n", "<leader>tp", function()
          client:exec_cmd({
            title = "pin",
            command = "tinymist.pinMain",
            arguments = { vim.api.nvim_buf_get_name(0) },
          }, { bufnr = bufnr })
        end, { desc = "[T]inymist [P]in", noremap = true })

        vim.keymap.set("n", "<leader>tu", function()
          client:exec_cmd({
            title = "unpin",
            command = "tinymist.pinMain",
            arguments = { vim.v.null },
          }, { bufnr = bufnr })
        end, { desc = "[T]inymist [U]npin", noremap = true })
      end,
    })
  end,
}
