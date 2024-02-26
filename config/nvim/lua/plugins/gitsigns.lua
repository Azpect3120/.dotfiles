return {
  "lewis6991/gitsigns.nvim",
  lazy = false,
  keys = {
    { "<leader>gh", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview Git Hunk" },
  },
  config = function ()
    require("gitsigns").setup()
  end
}
