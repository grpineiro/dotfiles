local status = pcall(require, 'nvim-treesitter')
if not status then return end

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "tsx",
    "typescript",
    "javascript",
    "toml",
    "json",
    "yaml",
    "html",
    "css",
    "scss",
    "lua"
  },
}
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
