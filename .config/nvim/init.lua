vim.cmd([[ runtime ./maps.vim ]])

require('core')
require('plugins')
require('config')

local opt = vim.opt
local cmd = vim.cmd

local w = vim.loop.new_fs_poll()
local function on_change(bufNr, filePath)
  vim.api.nvim_command('checktime ' .. bufNr)
  w:stop()
  Watch_file(bufNr, filePath)
end
function Watch_file(bufNr, filePath)
  w:start(filePath, 1000, vim.schedule_wrap(function(...)
    on_change(bufNr, filePath) end))
end
vim.api.nvim_command(
  "command! -nargs=0 Watch call luaeval('watch_file(_A[1], _A[2])', [bufnr('%'), expand('%:p')])"
)

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
