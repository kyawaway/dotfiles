local wezterm = require 'wezterm';
return {
  -- font
  font = wezterm.font_with_fallback({
    {family="MesloLGS NF", weight="Regular"},
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
  default_prog = {"zsh", "--login"}
}