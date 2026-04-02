local has_display = vim.env.DISPLAY ~= nil or vim.env.WAYLAND_DISPLAY ~= nil

return {
  -- yanky uses system clipboard; disable on headless remotes
  {
    "gbprod/yanky.nvim",
    enabled = has_display,
  },
}
