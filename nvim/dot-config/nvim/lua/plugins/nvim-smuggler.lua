return {
  "klafyvel/nvim-smuggler",
  version = false,
  config = true,
  keys = {
    {
      "<leader>cs",
      ":SmuggleRange",
      desc = "Smuggle range",
      mode = { "v" },
    },
    dependencies = { "nvim-neotest/nvim-nio" },
  },
}
