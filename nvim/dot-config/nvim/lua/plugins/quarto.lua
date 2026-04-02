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
    opts = {
      codeRunner = {
        default_method = "slime"
      }
    }
  },
}
