local opt = vim.opt
local cmd = vim.cmd

cmd([[ set guicursor+=a:blinkon1 ]])
opt.hidden = true
opt.number = true
opt.mouse = "a"
opt.inccommand = "split"
opt.smarttab = true
opt.cindent = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoread = true
opt.encoding = "UTF-8"
opt.laststatus = 3
vim.g.syntax_on = true
