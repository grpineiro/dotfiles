local wezterm = require 'wezterm';

return {
  -- You can specify some parameters to influence the font selection;
  -- for example, this selects a Bold, Italic font variant.
  font = wezterm.font("JetBrains Mono", {weight="Bold", italic=false}),
  color_scheme = "nord",
  hide_tab_bar_if_only_one_tab = true,
--  window_background_opacity = 0.6,
  keys = {
    { key="n", mods="SHIFT|CTRL", action="ToggleFullScreen" },
  },

  window_padding = {
    left = 2,
    right = 2,
    top = 0,
    bottom = 0,
  }
}
