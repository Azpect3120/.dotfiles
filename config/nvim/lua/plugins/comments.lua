return {
  "numToStr/Comment.nvim",
  opts = {
    padding = true,
    ---Whether the cursor should stay at its position
    sticky = true,
    ---LHS of toggle mappings in NORMAL mode
    toggler = {
      line = "<leader>/",
    },
    ---LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
      ---Block-comment keymap
      block = "<leader>/",
    },
    ---LHS of extra mappings
    extra = {
      ---Add comment on the line above
      -- above = "gcO",
      ---Add comment on the line below
      -- below = "gco",
      ---Add comment at the end of line
      -- eol = "gcA",
    },
    ---Enable keybindings
    ---NOTE: If given `false` then the plugin won"t create any mappings
    mappings = {
      ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
      basic = true,
      ---Extra mapping; `gco`, `gcO`, `gcA`
      extra = true,
    },
  },
  lazy = false,
}
