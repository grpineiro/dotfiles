runtime ./plug.vim
runtime ./maps.vim

lua << EOF
  require('plugins')
  require('config')

  local w = vim.loop.new_fs_poll()
  local function on_change(bufNr, filePath)
    vim.api.nvim_command('checktime ' .. bufNr)
    w:stop()
    watch_file(bufNr, filePath)
  end
  function watch_file(bufNr, filePath)
    w:start(filePath, 1000, vim.schedule_wrap(function(...)
      on_change(bufNr, filePath) end))
  end
  vim.api.nvim_command(
    "command! -nargs=0 Watch call luaeval('watch_file(_A[1], _A[2])', [bufnr('%'), expand('%:p')])"
  )

EOF

set hidden
set number
set relativenumber
set mouse=a
set inccommand=split
set smarttab
set cindent
set tabstop=2
set shiftwidth=2
set expandtab
set autoread
set encoding=UTF-8
"set termguicolors

highlight WinSeparator guibg=None

syntax enable
"colorscheme NeoSolarized
"set background=dark
"let g:onedark_style = 'darker'
colorscheme nord
hi Normal guibg=NONE ctermbg=NONE

au FocusGained * :checktime

"hi NonText guifg=250 guifg=none hi Normal guifg=252 guibg=none

set laststatus=3
