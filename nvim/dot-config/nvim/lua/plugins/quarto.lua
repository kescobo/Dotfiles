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
