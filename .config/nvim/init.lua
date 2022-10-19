vim.cmd("runtime ./maps.vim")

require('core')
require('plugins')
require('config')

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

