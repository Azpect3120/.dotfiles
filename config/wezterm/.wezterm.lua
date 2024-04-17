-- Pull in the wezterm API local wezterm = require 'wezterm'
local wezterm = require("wezterm")

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
  font = wezterm.font { family = "RobotoN", weight = "Bold" },

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
config.keys = {
  -- Tabs
  { key = "t", mods = "SUPER", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
  { key = "w", mods = "SUPER", action = wezterm.action.CloseCurrentTab({ confirm = false }) },
  -- Splits
  { key = "%", mods = "CTRL|SHIFT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
  { key = "\"", mods = "CTRL|SHIFT", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  { key = "q", mods = "CTRL|SHIFT", action = wezterm.action.CloseCurrentPane({ confirm = false }) },
  -- Moving Around Splits
  { key = "h", mods = "CTRL", action = wezterm.action.ActivatePaneDirection("Left") },
  { key = "j", mods = "CTRL", action = wezterm.action.ActivatePaneDirection("Down") },
  { key = "k", mods = "CTRL", action = wezterm.action.ActivatePaneDirection("Up") },
  { key = "l", mods = "CTRL", action = wezterm.action.ActivatePaneDirection("Right") },
  -- Resizing Splits
  { key = "h", mods = "CTRL|SHIFT", action = wezterm.action.AdjustPaneSize({ "Left", 5 }) },
  { key = "j", mods = "CTRL|SHIFT", action = wezterm.action.AdjustPaneSize({ "Down", 5 }) },
  { key = "k", mods = "CTRL|SHIFT", action = wezterm.action.AdjustPaneSize({ "Up", 5 }) },
  { key = "l", mods = "CTRL|SHIFT", action = wezterm.action.AdjustPaneSize({ "Right", 5 }) },
}

-- SSH Domains: Doesn't seem to work
--[[ config.ssh_domains = {
  {
    name = "gophernest",
    remote_address = "38.188.134.128",
    username = "azpect",
  },
} ]]

-- Fixes weird error
config.warn_about_missing_glyphs = false

-- and finally, return the configuration to wezterm
return config
