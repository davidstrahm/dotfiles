-- Helper function:
-- returns color scheme dependant on operating system theme setting (dark/light)
local function color_scheme_for_appearance(appearance)
  if appearance:find "Dark" then
    return "Tokyo Night"
  else
    return "Tokyo Night Light (Gogh)"
  end
end


local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- layout
config.initial_cols = 140
config.initial_rows = 35

-- font
config.font_size = 16
config.font = wezterm.font('CaskaydiaCove NF')
-- config.color_scheme = 'AdventureTime'
config.color_scheme = 'Tokyo Night'

-- config.color_scheme = color_scheme_for_appearance(wezterm.gui.get_appearance())
-- config.hide_tab_bar_if_only_one_tab = true
config.native_macos_fullscreen_mode = false

-- visuals
config.window_background_opacity = 0.96
config.window_decorations = 'RESIZE'
config.enable_scroll_bar = true
config.enable_tab_bar = false

config.scrollback_lines = 20000
config.window_frame = {
    border_left_width = '1px',
    border_right_width = '1px',
    border_bottom_height = '1px',
    border_top_height = '0px',
    border_left_color = '#484848',
    border_right_color = '#484848',
    border_bottom_color = '#484848',
    border_top_color = '#484848',
}





-- keyboard shortcuts
-- split panes horizontally
config.keys = {
  {
    key = 'd',
    mods = 'CMD',
    action = wezterm.action.SplitHorizontal({ domain = 'CurrentPaneDomain' }),
  },
  -- split panes vertically
  {
    key = 'd',
    mods = 'CMD|SHIFT',
    action = wezterm.action.SplitVertical({ domain = 'CurrentPaneDomain' }),
  },
-- close current pane
  {
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentPane { confirm = false },
  },
-- show command palette
  {
    key = 'p',
    mods = 'CMD',
    action = wezterm.action.ActivateCommandPalette,
  },
  -- start of line
  {
   key = 'LeftArrow',
   mods = 'CMD',
   action = wezterm.action { SendString = "\x1bOH" },
 },
    -- end of line 
 {
   key = 'RightArrow',
   mods = 'CMD',
   action = wezterm.action { SendString = "\x1bOF" },
 },
-- alt + arrow for word navigation
 {
    key = 'LeftArrow',
    mods = 'OPT',
    action = wezterm.action.SendKey {
      key = 'b',
      mods = 'ALT',
    },
  },
  {
    key = 'RightArrow',
    mods = 'OPT',
    action = wezterm.action.SendKey { key = 'f', mods = 'ALT' },
  },
  -- clear
  {
    key = 'k',
    mods = 'CMD',
    action = wezterm.action.SendString 'clear\n',
  },
}

-- config.send_composed_key_when_left_alt_is_pressed = true


return config