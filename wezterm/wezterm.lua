local wezterm = require 'wezterm'
local act = wezterm.action

local colors = {
  rosewater = '#F4DBD6',
  flamingo = '#F0C6C6',
  pink = '#F5BDE6',
  mauve = '#C6A0F6',
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
  check_for_updates = true,
  color_scheme = 'Catppuccin Mocha',
  cursor_blink_ease_in = 'Constant',
  cursor_blink_ease_out = 'Constant',
  cursor_blink_rate = 700,
  default_cursor_style = 'BlinkingBlock',
  hide_tab_bar_if_only_one_tab = true,
  initial_cols = 110,
  initial_rows = 24,
  line_height = 1.2,
  show_new_tab_button_in_tab_bar = false,
  tab_bar_at_bottom = true,
  tab_max_width = 50,
  term = 'wezterm',
  underline_position = '200%',
  underline_thickness = 2,
  use_fancy_tab_bar = false,
  window_close_confirmation = 'NeverPrompt',
  window_decorations = 'NONE',
  window_padding = {
    left = 1,
    top = 1,
    right = 1,
    bottom = 0,
  },
  font = wezterm.font_with_fallback {
    'Cascadia Code',
    'CaskaydiaCove Nerd Font',
  },
  keys = {
    -- clipboard
    { key = 'v', mods = 'CTRL',       action = act.PasteFrom 'Clipboard' },
    -- splitting
    { key = 'd', mods = 'ALT|SHIFT',  action = act.SplitPane { direction = 'Right' } },
    { key = 'f', mods = 'ALT|SHIFT',  action = act.SplitPane { direction = 'Down' } },
    -- new tab
    { key = 't', mods = 'CTRL|SHIFT', action = act.SpawnCommandInNewTab { cwd = '~' } },
    -- close pane
    { key = 'w', mods = 'CTRL|SHIFT', action = act.CloseCurrentPane { confirm = false } },
    -- pane movement
    { key = 'h', mods = 'ALT|SHIFT',  action = act.ActivatePaneDirection 'Left' },
    { key = 'j', mods = 'ALT|SHIFT',  action = act.ActivatePaneDirection 'Down' },
    { key = 'k', mods = 'ALT|SHIFT',  action = act.ActivatePaneDirection 'Up' },
    { key = 'l', mods = 'ALT|SHIFT',  action = act.ActivatePaneDirection 'Right' },
    -- pane resize
    { key = 'h', mods = 'CTRL|SHIFT', action = act.AdjustPaneSize { 'Left', 1 } },
    { key = 'j', mods = 'CTRL|SHIFT', action = act.AdjustPaneSize { 'Down', 1 } },
    { key = 'k', mods = 'CTRL|SHIFT', action = act.AdjustPaneSize { 'Up', 1 } },
    { key = 'l', mods = 'CTRL|SHIFT', action = act.AdjustPaneSize { 'Right', 1 } },
    -- tab navigation
    { key = '1', mods = 'ALT',        action = act.ActivateTab(0) },
    { key = '2', mods = 'ALT',        action = act.ActivateTab(1) },
    { key = '3', mods = 'ALT',        action = act.ActivateTab(2) },
    { key = '4', mods = 'ALT',        action = act.ActivateTab(3) },
    { key = '5', mods = 'ALT',        action = act.ActivateTab(4) },
    { key = 'L', mods = 'CTRL',       action = wezterm.action.ShowDebugOverlay },
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
