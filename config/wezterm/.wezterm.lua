-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Configure tab bar
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = true

-- Style the tab bar
config.window_frame = {
  -- The font used in the tab bar.
  -- Roboto Bold is the default; this font is bundled
  -- with wezterm.
  -- Whatever font is selected here, it will have the
  -- main font setting appended to it to pick up any
  -- fallback fonts you may have used there.
  font = wezterm.font { family = "Roboto", weight = "Bold" },

  -- The size of the font in the tab bar.
  -- Default to 10.0 on Windows but 12.0 on other systems
  font_size = 12.0,

  -- The overall background color of the tab bar when
  -- the window is focused
  active_titlebar_bg = "#333333",

  -- The overall background color of the tab bar when
  -- the window is not focused
  inactive_titlebar_bg = "#333333",
}

-- Window settings
config.window_padding = {
  left = 4,
  right = 4,
  top = 4,
  bottom = 4
}

-- Window background wallpaper
-- config.window_background_image = '/path/to/wallpaper.jpg'

-- Configure fonts
config.font = wezterm.font("JetBrains Mono", { italic = false, weight = "Regular" })
config.font_size = 14.0

-- Define the starting directory
config.default_cwd = "$HOME"

-- Configure colors
config.color_scheme = "Kanagawa (Gogh)"

config.colors = {
  tab_bar = {
    -- The color of the inactive tab bar edge/divider
    inactive_tab_edge = "#575757",
  },
}

-- Configure keymaps
-- config.keys = {}

-- and finally, return the configuration to wezterm
return config
