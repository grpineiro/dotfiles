local status, lualine = pcall(require, 'lualine')
if not status then return end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'nord',
    section_separators = { left = '', right = ''},
    component_separators = '|',
    disabled_filetypes = {},
    globalstatus = true,
  },
  sections = {
    lualine_a = {{ 'mode', separator = { left = '' }, right_padding = 2 }},
    lualine_b = { 'filename', { 'branch', icons_enabled = true, icon = "" } },
    lualine_c = {'fileformat'},
    lualine_x = {
      { 'diagnostics', sources = {"nvim_diagnostic"}, symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '} },
      'encoding',
    },
    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
      {'location', separator = { right = '' }, left_padding = 2 },
    }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {'location'}
  },
  tabline = {},
  extensions = {'fugitive'}
}
