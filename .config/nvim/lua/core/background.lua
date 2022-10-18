local status, nord = pcall(require, "nord")
if not status then return end

vim.g.nord_italic = false
vim.g.nord_disable_background = false
vim.g.nord_borders = true
vim.g.nord_contrast = true

nord.set()
