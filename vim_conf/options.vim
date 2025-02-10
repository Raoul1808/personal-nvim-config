set number relativenumber
set noswapfile
set shiftwidth=4
set tabstop=4
set termguicolors
set colorcolumn=81

let s:hidden_all = 0
set noshowmode
set noruler
set laststatus=0
set noshowcmd

tnoremap <esc> <C-\><C-n>

augroup FormatAutoGroup
	autocmd!
	autocmd BufWritePost * FormatWrite
augroup END

au BufNewFile,BufRead *.wgsl set filetpye=wgsl

silent! colorscheme onedark
