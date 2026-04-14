-- plugins/quarto.lua
return {
  {
    "quarto-dev/quarto-nvim",
    ft = { "quarto" },
    dependencies = {
      "jmbuhr/otter.nvim",
      "nvim-treesitter/nvim-treesitter",
      "jpalardy/vim-slime",
    },
    keys = {
      { "<leader>cc", "<cmd>QuartoSend<cr>",      desc = "Send cell" },
      { "<leader>cj", function()
          vim.cmd("QuartoSend")
          vim.schedule(function()
            local row = vim.fn.search("^```{", "W")
            if row > 0 then
              vim.api.nvim_win_set_cursor(0, { row + 1, 0 })
            end
          end)
        end, desc = "Send cell and move to next" },
      { "<leader>cc", ":<C-u>QuartoSendRange<cr>", desc = "Send range", mode = "v" },
      { "<leader>ca", "<cmd>QuartoSendAll<cr>",   desc = "Send all cells" },
      { "<leader>cu", "<cmd>QuartoSendAbove<cr>", desc = "Send cells above" },
      { "<leader>cp", "<cmd>QuartoPreview<cr>",   desc = "Preview" },
    },
    opts = {
      codeRunner = {
        default_method = "slime"
      }
    }
  },
}
