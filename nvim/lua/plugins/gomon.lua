return {
  "azpect3120/gomon.nvim",
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
