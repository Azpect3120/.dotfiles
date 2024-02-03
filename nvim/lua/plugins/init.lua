return {
  ------------------------------------------------------------------------------------
  -- COLOR SCHEMES
  ------------------------------------------------------------------------------------
  {
    "rebelot/kanagawa.nvim",
    config = function()
      vim.cmd("colorscheme kanagawa")
    end
  },
  ------------------------------------------------------------------------------------
  -- LSP & COMPLETIONS
  ------------------------------------------------------------------------------------
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "windwp/nvim-ts-autotag" },
  {
    "windwp/nvim-autopairs",
    opts = { map_cr = true }
  },
}
