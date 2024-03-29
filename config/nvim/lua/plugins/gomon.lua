return {
  "azpect3120/gomon.nvim",
  -- dir = "~/Documents/gomon.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function ()
    require("gomon").setup({
      window = {
        style = "float",
        wrap = false,
      },
      display_on_start = true,
      close_on_stop = true,
    })

    vim.keymap.set("n", "<leader>gt", "<cmd>Gomon toggle_display<cr>")
  end
}
