local wezterm = require 'wezterm' ---@type Wezterm
local act = wezterm.action

local colors = {
  rosewater = '#f4dbd6',
  flamingo = '#f0c6c6',
  pink = '#f5bde6',
  mauve = '#c5a0f6',
  red = '#ed8796',
  maroon = '#ee99a0',
  peach = '#f5a97f',
  yellow = '#eed49f',
  green = '#a6da95',
  teal = '#8bd5ca',
  sky = '#91d7e3',
  sapphire = '#7dc4e4',
  blue = '#8aadf4',
  lavender = '#b7bdf8',
  text = '#cad3f5',
  subtext1 = '#b8c0e0',
  subtext0 = '#a5adcb',
  overlay2 = '#939ab7',
  overlay1 = '#8087a2',
  overlay0 = '#6e738d',
  surface2 = '#5b6078',
  surface1 = '#494d64',
  surface0 = '#363a4f',
  base = '#24273a',
  mantle = '#1e2030',
  crust = '#181825',
  bar = '#11111b',
}

wezterm.on('format-tab-title', function(tab, _, _, _, _, max_width)
  local title = wezterm.truncate_right(tab.active_pane.title, max_width)
  local title_bg = colors.bar
  local title_fg = colors.subtext0

  if tab.is_active then
    title_bg = colors.pink
    title_fg = colors.crust
  end

  return wezterm.format {
    { foreground = { color = title_fg } },
    { background = { color = title_bg } },
    { text = string.format(' %s ', title) },
    { background = { color = colors.bar } },
  }
end)

---@type weztermconfig
return {
  adjust_window_size_when_changing_font_size = true,
  enable_scroll_bar = false,
  check_for_updates = true,
  color_scheme = 'Catppuccin Mocha',
  colors = {
    background = colors.crust,
  },
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
  window_background_opacity = 0.9,
  macos_window_background_blur = 100,
  window_decorations = 'RESIZE',
  window_padding = {
    left = 4,
    top = 4,
    right = 0,
    bottom = 0,
  },
  font_size = 16,
  font = wezterm.font_with_fallback {
    -- 'Recursive',      -- 1.3 line_height
    'Maple Mono',
    'Maple Mono NF',
  },
  keys = {
    -- clipboard
    { key = 'v', mods = 'CTRL',        action = act.PasteFrom 'Clipboard' },
    -- splitting
    { key = 'd', mods = 'SUPER|SHIFT', action = act.SplitPane { direction = 'Right' } },
    { key = 'f', mods = 'SUPER|SHIFT', action = act.SplitPane { direction = 'Down' } },
    -- new tab
    { key = 't', mods = 'META|SHIFT',  action = act.SpawnCommandInNewTab { cwd = '~' } },
    -- close pane
    { key = 'w', mods = 'META|SHIFT',  action = act.CloseCurrentPane { confirm = false } },
    -- pane movement
    { key = 'h', mods = 'SUPER|SHIFT', action = act.ActivatePaneDirection 'Left' },
    { key = 'j', mods = 'SUPER|SHIFT', action = act.ActivatePaneDirection 'Down' },
    { key = 'k', mods = 'SUPER|SHIFT', action = act.ActivatePaneDirection 'Up' },
    { key = 'l', mods = 'SUPER|SHIFT', action = act.ActivatePaneDirection 'Right' },
    -- pane resize
    { key = 'h', mods = 'META|CTRL',   action = act.AdjustPaneSize { 'Left', 5 } },
    { key = 'j', mods = 'META|CTRL',   action = act.AdjustPaneSize { 'Down', 5 } },
    { key = 'k', mods = 'META|CTRL',   action = act.AdjustPaneSize { 'Up', 5 } },
    { key = 'l', mods = 'META|CTRL',   action = act.AdjustPaneSize { 'Right', 5 } },
    -- tab navigation
    { key = 'h', mods = 'SUPER',       action = act.ActivateTabRelative(-1) },
    { key = 'l', mods = 'SUPER',       action = act.ActivateTabRelative(1) },
    -- reorder tabs
    { key = 'h', mods = 'SUPER|CTRL',  action = act.MoveTabRelative(-1) },
    { key = 'l', mods = 'SUPER|CTRL',  action = act.MoveTabRelative(1) },
    -- { key = 'L', mods = 'CTRL',       action = wezterm.action.ShowDebugOverlay },
    -- close tab
    { key = 'D', mods = 'CTRL|SHIFT',  action = wezterm.action.CloseCurrentTab { confirm = false } },
    -- fullscreen
    { key = 'k', mods = 'SHIFT|CTRL',  action = wezterm.action.ToggleFullScreen },
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
