return {
  "folke/trouble.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    { "<leader>tt", "<cmd>Trouble diagnostics<cr>", desc = "Toggle the error log" }
  }
}
