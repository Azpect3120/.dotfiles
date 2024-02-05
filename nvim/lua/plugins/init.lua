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
  {
    "github/copilot.vim",
    config = function ()
        vim.keymap.set('i', '<C-y>', 'copilot#Accept("\\<CR>")', {
          expr = true,
          replace_keycodes = false
        })
        vim.g.copilot_no_tab_map = true
    end
  },
  ------------------------------------------------------------------------------------
  -- UTILITIES
  ------------------------------------------------------------------------------------
  { "tamton-aquib/keys.nvim" },

}
