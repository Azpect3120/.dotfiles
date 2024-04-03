return {
  opts = {},
  keys = {
    { "<leader>ht", function() require("hex").toggle() end, desc = "Toggle Hex Editor" },
  },
  cmd = { "HexToggle", "HexDump", "HexAssemble" },
  "RaafatTurki/hex.nvim",
}
