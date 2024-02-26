return {
  --[[ "m4xshen/hardtime.nvim",
  dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  opts = {
    max_time = 1000,
    max_count = 5,
    allow_different_key = false,
    disabled_filetypes = { "qf", "netrw", "NvimTree", "lazy", "mason", "oil" },
    disabled_keys = {
      ["<Up>"] = {},
      ["<Space>"] = { "n", "x" },
    },
  } ]]
}
