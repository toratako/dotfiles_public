-- Based on: https://zenn.dev/mozumasu/articles/mozumasu-wezterm-customization
-- Thank you!

local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "Breeze"

config.check_for_updates = false
config.show_update_window = false
config.automatically_reload_config = true
config.use_ime = true
config.scrollback_lines = 10000
-- config.window_close_confirmation = "NeverPrompt"
-- config.enable_scroll_bar = true

config.font_size = 10.0
config.window_background_opacity = 0.8
-- config.kde_window_background_blur = true

config.default_cursor_style = "BlinkingBar"
config.animation_fps = 1
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"

config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
-- config.integrated_title_button_style = "Gnome"
config.integrated_title_button_alignment = "Right"
config.integrated_title_buttons = { "Hide", "Maximize", "Close" }

config.show_tab_index_in_tab_bar = false
config.switch_to_last_active_tab_when_closing_tab = true

local WINDOW_FRAME_COLOR = "#a4aed6"

config.window_padding = {
  left = 4,
  right = 4,
  top = 0,
  bottom = 0,
}

config.window_frame = {
  inactive_titlebar_bg = "none",
  active_titlebar_bg = "none",

  border_left_width = "0.2cell",
  border_right_width = "0.2cell",
  border_bottom_height = "0.1cell",
  border_top_height = "0.1cell",

  border_left_color = WINDOW_FRAME_COLOR,
  border_right_color = WINDOW_FRAME_COLOR,
  border_bottom_color = WINDOW_FRAME_COLOR,
  border_top_color = WINDOW_FRAME_COLOR
}

-- make tab-bar black
config.window_background_gradient = {
  colors = { "#000000" },
}

-- https://wezterm.org/config/appearance.html
config.colors = {

  tab_bar = {
    inactive_tab_edge = "none",

    background = "#00FFFF",

    -- overwrote active-tab color with format-tab-title so this is applied for hover only.
    -- active_tab = {
    --   bg_color = "#00FF00",
    --   fg_color = "#00FF00",
    --   intensity = "Normal",
    --   underline = "None",
    --   italic = false,
    --   strikethrough = false,
    -- },

    -- inactive_tab = {
    --   bg_color = "#FF0000",
    --   fg_color = "#FF0000",
    -- },

    -- inactive_tab_hover = {
    --   bg_color = "#FF0000",
    --   fg_color = "#FF0000",
    --   italic = true,
    -- },

    new_tab = {
      bg_color = "none",
      fg_color = "#FFFFFF",
    },

    new_tab_hover = {
      bg_color = "none",
      fg_color = "#FFFFFF",
      italic = true,
    },
  },
}

-- config.inactive_pane_hsb = {
--   saturation = 0.5,
--   brightness = 0.5,
-- }

local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_lower_right_triangle
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_upper_left_triangle


-- config.show_tabs_in_tab_bar = false
-- config.show_new_tab_button_in_tab_bar = false
-- config.enable_tab_bar = false
-- config.hide_tab_bar_if_only_one_tab = false

-- https://wezterm.org/config/lua/window-events/format-tab-title.html
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local background = "#5c6d74"
  local foreground = "#FFFFFF"

  local edge_background = "none"
  if tab.is_active then
    background = "#6a6fb1"
    foreground = "#FFFFFF"
  end

  local edge_foreground = background
  local title = " " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. " "

  return {
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = SOLID_LEFT_ARROW },

    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = title },

    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = SOLID_RIGHT_ARROW },
  }
end)

-- right top
wezterm.on("update-status", function(window)
  local color_scheme = window:effective_config().resolved_palette
  -- local bg = color_scheme.background
  local bg = "#6a6fb1"
  local fg = color_scheme.foreground

  window:set_right_status(wezterm.format({
    { Background = { Color = "none" } },
    { Foreground = { Color = bg } },
    { Text = SOLID_LEFT_ARROW },

    { Background = { Color = bg } },
    { Foreground = { Color = fg } },
    { Text = "  " .. wezterm.hostname() .. "   " },

    { Background = { Color = "none" } },
    { Foreground = { Color = bg } },
    { Text = SOLID_RIGHT_ARROW .. "     " },
  }))
end)

-- !!You can't use Wezterm with tmux now!!!
-- Ref: https://github.com/wezterm/wezterm/issues/4317
-- if there is already session number 0, attach to it. Otherwise, create a new session.
-- config.default_prog = { "/bin/zsh", "-l", "-c", "tmux attach-session -t 0 || tmux new-session -s 0" }

-- config.disable_default_key_bindings = true
-- config.keys = require("keybinds").keys
-- config.key_tables = require("keybinds").key_tables
-- config.leader = { key = "q", mods = "CTRL", timeout_milliseconds = 2000 }

return config
