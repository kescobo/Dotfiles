return {
  "klafyvel/nvim-smuggler",
  version = false,
  config = true,
  keys = {
    {
      "<leader>cs",
      ":SmuggleRange<CR>",
      desc = "Smuggle range",
    },
  },
  dependencies = { "nvim-neotest/nvim-nio" },
}
