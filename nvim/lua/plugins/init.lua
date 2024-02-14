return { ------------------------------------------------------------------------------------
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
        vim.keymap.set('i', '<C-g>', 'copilot#Accept("\\<CR>")', {
          expr = true,
          replace_keycodes = false
        })
        vim.g.copilot_no_tab_map = true
    end
  },
  { "folke/neodev.nvim" },
  ------------------------------------------------------------------------------------
  -- MY OWN PLUGINS
  ------------------------------------------------------------------------------------
  {
    "azpect3120/keystrokes.nvim",
    cmd = "Keystrokes",
    keys = {
      { "<leader>ks", "<cmd>Keystrokes<cr>", desc = "Toggles Keystrokes" },
    },
    opts = {
      max_display = 24,
      window = {
        width = 30,
        height = 1,
        title = "Blazingly Fast Fingers",
        title_pos = "center",
        border = "rounded",
      },
    },
  },
}
