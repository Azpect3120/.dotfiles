return {
  'stevearc/oil.nvim',
  opts = {
    -- Set to false if you still want to use netrw
    default_file_explorer = false,
    -- Id is automatically added at the beginning, and name at the end
    -- See :help oil-columns
    columns = {
      "type",
      "icon",
      -- "permissions",
      -- "size",
      -- "mtime",
    },
    view_options = {
      -- Show files and directories that start with "."
      show_hidden = true,
    },
    float = {
      -- Padding around the floating window
      padding = 4,
      max_width = 0,
      max_height = 0,
      border = "rounded",
      win_options = {
        winblend = 0,
      },
      -- This is the config that will be passed to nvim_open_win.
      -- Change values here to customize the layout
      override = function(conf)
        return conf
      end,
    },
  },
  keys = {
    { "<leader>-", function () require("oil").toggle_float() end, desc = "Open Parent Directory In Buffer" }
  },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
}
