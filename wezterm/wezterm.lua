local wezterm = require 'wezterm'
local act = wezterm.action

local colors = {
  rosewater = '#F4DBD6',
  flamingo = '#F0C6C6',
  pink = '#F5BDE6',
  mauve = '#C5A0F6',
  red = '#ED8796',
  maroon = '#EE99A0',
  peach = '#F5A97F',
  yellow = '#EED49F',
  green = '#A6DA95',
  teal = '#8BD5CA',
  sky = '#91D7E3',
  sapphire = '#7DC4E4',
  blue = '#8AADF4',
  lavender = '#B7BDF8',
  text = '#CAD3F5',
  subtext1 = '#B8C0E0',
  subtext0 = '#A5ADCB',
  overlay2 = '#939AB7',
  overlay1 = '#8087A2',
  overlay0 = '#6E738D',
  surface2 = '#5B6078',
  surface1 = '#494D64',
  surface0 = '#363A4F',
  base = '#24273A',
  mantle = '#1E2030',
  crust = '#181926',
  bar = '#11111b',
}

wezterm.on('format-tab-title', function(tab, _, _, _, _, max_width)
  local title = wezterm.truncate_right(tab.active_pane.title, max_width - 6)
  local idx_bg = colors.surface0
  local idx_fg = colors.overlay0
  local title_bg = colors.mantle
  local title_fg = colors.text

  if tab.is_active then
    idx_bg = colors.lavender
    idx_fg = colors.crust
    title_bg = colors.base
    title_fg = colors.text
  end

  return wezterm.format {
    { Foreground = { Color = idx_fg } },
    { Background = { Color = idx_bg } },
    { Attribute = { Intensity = 'Bold' } },
    { Text = string.format(' %s ', tab.tab_index + 1) },
    { Foreground = { Color = title_fg } },
    { Background = { Color = title_bg } },
    { Text = string.format(' %s ', title) },
    { Background = { Color = colors.bar } },
    { Text = ' ' },
  }
end)

return {
  adjust_window_size_when_changing_font_size = false,
  enable_scroll_bar = false,
  check_for_updates = true,
  color_scheme = 'Catppuccin Mocha',
  cursor_blink_ease_in = 'Constant',
  cursor_blink_ease_out = 'Constant',
  cursor_blink_rate = 700,
  default_cursor_style = 'BlinkingBlock',
  hide_tab_bar_if_only_one_tab = true,
  initial_cols = 140,
  initial_rows = 34,
  line_height = 1.2,
  show_new_tab_button_in_tab_bar = false,
  tab_bar_at_bottom = false,
  tab_max_width = 50,
  underline_position = '200%',
  underline_thickness = 2,
  use_fancy_tab_bar = false,
  window_background_opacity = 0.85,
  macos_window_background_blur = 30,
  window_close_confirmation = 'NeverPrompt',
  window_decorations = 'RESIZE',
  window_padding = {
    left = 4,
    top = 4,
    right = 0,
    bottom = 0,
  },
  font_size = 13,
  font = wezterm.font_with_fallback {
    'Maple Mono',
    'Cascadia Code',
    'CaskaydiaCove NF',
  },
  keys = {
    -- clipboard
    { key = 'v', mods = 'CTRL',       action = act.PasteFrom 'Clipboard' },
    -- splitting
    { key = 'd', mods = 'SUPER|SHIFT', action = act.SplitPane { direction = 'Right' } },
    { key = 'f', mods = 'SUPER|SHIFT', action = act.SplitPane { direction = 'Down' } },
    -- new tab
    { key = 't', mods = 'META|SHIFT', action = act.SpawnCommandInNewTab { cwd = '~' } },
    -- close pane
    { key = 'w', mods = 'META|SHIFT', action = act.CloseCurrentPane { confirm = false } },
    -- pane movement
    { key = 'h', mods = 'SUPER|SHIFT', action = act.ActivatePaneDirection 'Left' },
    { key = 'j', mods = 'SUPER|SHIFT', action = act.ActivatePaneDirection 'Down' },
    { key = 'k', mods = 'SUPER|SHIFT', action = act.ActivatePaneDirection 'Up' },
    { key = 'l', mods = 'SUPER|SHIFT', action = act.ActivatePaneDirection 'Right' },
    -- pane resize
    { key = 'h', mods = 'META|CTRL',  action = act.AdjustPaneSize { 'Left', 5 } },
    { key = 'j', mods = 'META|CTRL',  action = act.AdjustPaneSize { 'Down', 5 } },
    { key = 'k', mods = 'META|CTRL',  action = act.AdjustPaneSize { 'Up', 5 } },
    { key = 'l', mods = 'META|CTRL',  action = act.AdjustPaneSize { 'Right', 5 } },
    -- tab navigation
    { key = 'h', mods = 'SUPER',      action = act.ActivateTabRelative(-1) },
    { key = 'l', mods = 'SUPER',      action = act.ActivateTabRelative(1) },
    -- reorder tabs
    { key = 'h', mods = 'SUPER|CTRL', action = act.MoveTabRelative(-1) },
    { key = 'l', mods = 'SUPER|CTRL', action = act.MoveTabRelative(1) },
    -- { key = 'L', mods = 'CTRL',       action = wezterm.action.ShowDebugOverlay },
    -- close tab
    { key = 'D', mods = 'CTRL|SHIFT', action = wezterm.action.CloseCurrentTab { confirm = false } },
    -- fullscreen
    { key = 'k', mods = 'SHIFT|CTRL', action = wezterm.action.ToggleFullScreen },
  },
  mouse_bindings = {
    {
      event = { Up = { streak = 1, button = 'Right' } },
      mods = 'NONE',
      action = act.CopyTo 'Clipboard',
    },
    {
      event = { Up = { streak = 1, button = 'Right' } },
      mods = 'CTRL',
      action = act.PasteFrom 'Clipboard',
    },
  },
}
