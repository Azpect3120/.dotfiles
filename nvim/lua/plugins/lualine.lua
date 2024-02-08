-- Custom harpoon status line component
-- Built for harpoon2
local function harpoon_status()
  local harpoon = require("harpoon")
  local length = harpoon:list():length()

  if length == 0 then
    return ""
  end

  local current = "—"

  local currentName = string.gsub(vim.api.nvim_buf_get_name(0), string.format("%s/", vim.fn.getcwd()), "")
  local i = 1
  while i <= length do
    local item = harpoon:list():get(i).value
    if item == currentName then current = tostring(i) break end
    i = i + 1
  end


  return string.format("󱡅 %s/%d", current, length)
end

return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    harpoon_status()
    require("lualine").setup {
      options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "", right = ""},
        section_separators = { left = "", right = ""},
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 500,
          tabline = 500,
          winbar = 500,
        }
      },
      sections = {
        lualine_a = {"mode"},
        lualine_b = {"branch", harpoon_status, "diff", "diagnostics"},
        lualine_c = {{"filename", path = 3}, "filesize"},
        lualine_x = {{"datetime", style = "%H:%M:%S"}, {"datetime", style="%D"}},
        lualine_y = {"encoding", "filetype"},
        lualine_z = {"location", "selectioncount"}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {"filename"},
        lualine_x = {"location"},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {
        "fugitive",
        "trouble",
        "lazy",
        "oil",
        "quickfix",
      }
    }
  end
}
