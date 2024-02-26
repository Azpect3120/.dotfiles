return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  keys = {
    {"<leader>wk", "<cmd>WhichKey<cr>", desc = "Display Which Key Menu" },
  },
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end
}
