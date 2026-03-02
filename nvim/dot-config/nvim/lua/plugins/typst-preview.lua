return {
  "chomosuke/typst-preview.nvim",
  ft = "typst",
  version = "1.*",
  opts = {}, -- lazy.nvim will implicitly calls `setup {}`
  keys = {
    { "<leader>tr", "<cmd>TypstPreview<cr>", desc = "[T]inymist P[r]eview" },
  },
}
