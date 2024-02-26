return {
  "rcarriga/nvim-notify",
  config = function()
    local util = require("notify.util")
    require("notify.config.highlights")

    local BUILTIN_RENDERERS = {
      DEFAULT = "default",
      MINIMAL = "minimal",
      SIMPLE = "simple",
      COMPACT = "compact",
      WRAPPED = "wrapped-compact",
    }

    local BUILTIN_STAGES = {
      FADE = "fade",
      SLIDE = "slide",
      FADE_IN_SLIDE_OUT = "fade_in_slide_out",
      STATIC = "static",
    }

    require('notify').setup({
      level = vim.log.levels.INFO,
      timeout = 5000,
      max_width = nil,
      max_height = nil,
      stages = BUILTIN_STAGES.SLIDE,
      render = BUILTIN_RENDERERS.WRAPPED,
      background_colour = "NotifyBackground",
      on_open = nil,
      on_close = nil,
      minimum_width = 50,
      fps = 30,
      top_down = true,
      time_formats = {
        notification_history = "%FT%T",
        notification = "%T",
      },
      icons = {
        ERROR = '',
        WARN = '',
        INFO = '',
        DEBUG = '',
        TRACE = '✎',
      },
    })
  end
}
