----------------------------------------
--  Colors from sunset.jpg wallpaper  --
----------------------------------------
local colors = {
  sky_blue = "#170d27",
  sky_purple = "#47153b",
  sky_purple_dark = "#3a1132",
  sky_red = "#e01d3b",
  sky_orange = "#f13a33",
  sky_yellow = "#fce308",
  foreground_shadow = "#31233d",
  polybar_bg = "#251342",
  polybar_fg = "#C5C8C6",
}

--------------------------
-- Custom awesome theme --
--------------------------
local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local gears = require("gears")
local dpi = xresources.apply_dpi
local os = { getenv = os.getenv }

local gfs = require("gears.filesystem")

local theme = {}

theme.font          = "Hack Nerd Font Mono 12"

theme.bg_normal     = "#222222"
theme.bg_focus      = "#535d6c"
theme.bg_urgent     = "#ff0000"
theme.bg_minimize   = "#444444"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#aaaaaa"
theme.fg_focus      = "#ffffff"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

theme.useless_gap   = dpi(3)
theme.border_width  = dpi(1)
theme.border_normal = colors.foreground_shadow
theme.border_focus  = "#4878e8"

---------------------------
--  Keybinds help popup  --
---------------------------
-- https://awesomewm.org/apidoc/popups_and_bars/awful.hotkeys_popup.widget.html
theme.hotkeys_font = "sans 14"
theme.hotkeys_description_font = "sans 14"
theme.hotkeys_shape = function(cr, w, h) gears.shape.rounded_rect(cr, w, h, 5) end
theme.hotkeys_group_margin = 15


------------------
--  Menu popup  --
------------------
theme.menu_width = 250
theme.menu_height = 30
theme.menu_font = "Hack Nerd Font Mono 12"
theme.menu_bg_normal = colors.polybar_bg
theme.menu_bg_focus = colors.sky_purple_dark
theme.menu_fg_normal = colors.polybar_fg
theme.menu_fg_focus = "#ffffff"


-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
-- theme.menu_submenu_icon = themes_path.."default/submenu.png"
-- theme.menu_height = dpi(15)
-- theme.menu_width  = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme
