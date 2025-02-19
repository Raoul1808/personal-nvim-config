set number relativenumber
set noswapfile
set shiftwidth=4
set tabstop=4
set termguicolors
set colorcolumn=81

let s:hidden_all = 0
set laststatus=3
set noruler
set cursorline

tnoremap <esc> <C-\><C-n>

augroup FormatAutoGroup
	autocmd!
	autocmd BufWritePost * FormatWrite
augroup END

au BufNewFile,BufRead *.wgsl set filetpye=wgsl

silent! colorscheme onedark
