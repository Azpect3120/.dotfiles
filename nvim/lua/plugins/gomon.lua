return {
  "azpect3120/gomon.nvim",
  -- dir = "~/Documents/gomon.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function ()
    require("gomon").setup({
      window = {
        style = "split_right",
        wrap = false,
      },
      display_on_start = true,
      close_on_stop = false,
    })
  end
}
