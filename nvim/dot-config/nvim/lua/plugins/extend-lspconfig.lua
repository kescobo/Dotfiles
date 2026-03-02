-- https://github.com/Myriad-Dreamin/tinymist/blob/main/editors/neovim/README.md#working-with-multiple-files-projects
return {
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>t", group = "Tinymist" },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tinymist = {},
      },
    },
    init = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client or client.name ~= "tinymist" then return end
          local bufnr = args.buf

          vim.keymap.set("n", "<leader>tp", function()
            client:exec_cmd({
              title = "pin",
              command = "tinymist.pinMain",
              arguments = { vim.api.nvim_buf_get_name(0) },
            }, { bufnr = bufnr })
          end, { buffer = bufnr, desc = "[T]inymist [P]in" })

          vim.keymap.set("n", "<leader>tu", function()
            client:exec_cmd({
              title = "unpin",
              command = "tinymist.pinMain",
              arguments = { vim.v.null },
            }, { bufnr = bufnr })
          end, { buffer = bufnr, desc = "[T]inymist [U]npin" })
        end,
      })
    end,
  },
}
