local status, theme = pcall(require, 'catppuccin')
if not status then return end

theme.setup {
  flavour = "mocha",
  background = {
    dark = "mocha",
  },
}

vim.cmd("colorscheme catppuccin")
