local wezterm = require 'wezterm';

return {
  initial_cols=142,
  initial_rows=42,
  -- You can specify some parameters to influence the font selection;
  -- for example, this selects a Bold, Italic font variant.
  font = wezterm.font("JetBrains Mono", {weight="Regular", italic=false}),
  font_size=13.0,
  color_scheme = "carbonfox",
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
  },

  enable_scroll_bar = true,

  default_cursor_style = "BlinkingBlock",
  cursor_blink_rate = 800,
  anti_alias_custom_block_glyphs = false,
  enable_kitty_graphics=true
}
