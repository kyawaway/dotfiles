local wezterm = require 'wezterm';
return {
  -- font
  font = wezterm.font_with_fallback({
    "MesloLGS NF",
    "Firge35Nerd Console",
    "Apple Color Emoji",
  }),
  font_size = 20.0,
  -- color scheme
  color_scheme = "iceberg-dark",

  -- tab bar
  use_fancy_tab_bar = false,
  colors = {
    cursor_bg= "#c6c8d1",
    tab_bar = {
      background = "#1b1f2f",

      active_tab = {
        bg_color = "#444b71",
        fg_color = "#c6c8d1",
        intensity = "Normal",
        underline = "None",
        italic = false,
        strikethrough = false,
      },

      inactive_tab = {
        bg_color = "#282d3e",
        fg_color = "#c6c8d1",
        intensity = "Normal",
        underline = "None",
        italic = false,
        strikethrough = false,
      },

      inactive_tab_hover = {
        bg_color = "#1b1f2f",
        fg_color = "#c6c8d1",
        intensity = "Normal",
        underline = "None",
        italic = true,
        strikethrough = false,
      },

      new_tab = {
        bg_color = "#1b1f2f",
        fg_color = "#c6c8d1",
        italic = false
      },

      new_tab_hover = {
        bg_color = "#444b71",
        fg_color = "#c6c8d1",
        italic = false
      },
    }
  },
  -- shell
  default_prog = {"zsh", "--login"},

  -- key bindings
  leader = { key = 'b', mods = 'CTRL', timeout_milliseconds = 1000 },
  keys = {
    {
      key = '%',
      mods = 'LEADER|SHIFT',
      action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
      key = '}',
      mods = 'LEADER|SHIFT',
      action = wezterm.action.SplitPane {
        direction = 'Right',
        --command = { args = { 'top' } },
        size = { Percent = 45 },
      },
    },
    {
      key = '"',
      mods = 'LEADER|SHIFT',
      action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
      key = 'c',
      mods = 'LEADER',
      action = wezterm.action({SpawnTab = "CurrentPaneDomain"}),
    },
    {
      key = 'h',
      mods = 'LEADER',
      action = wezterm.action.ActivateTabRelative(-1)
    },
    {
      key = 'l',
      mods = 'LEADER',
      action = wezterm.action.ActivateTabRelative(1)
    },
    {
      key = 'DownArrow',
      mods = 'LEADER',
      action = wezterm.action.PaneSelect
    },
    {
      key = "LeftArrow",
      mods = "CTRL|SHIFT",
      action = wezterm.action.SendKey {
        key = "b",
        mods = "META",
      },
    },
    {
      key = "RightArrow",
      mods = "CTRL|SHIFT",
      action = wezterm.action.SendKey {
        key = "f",
        mods = "META",
      },
    },
    {
      key = "Backspace",
      mods = "CTRL|SHIFT",
      action = wezterm.action.SendKey {
        key = "w",
        mods = "CTRL",
      },
    },
  },
 }
