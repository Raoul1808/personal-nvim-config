set number relativenumber
set noswapfile
set shiftwidth=4
set tabstop=4
set termguicolors
set colorcolumn=81

let g:c_syntax_for_h = 1

let s:hidden_all = 0
set laststatus=3
set noruler
set cursorline

tnoremap <esc> <C-\><C-n>

au BufNewFile,BufRead *.wgsl set filetpye=wgsl
au BufWritePost * lua require("lint").try_lint()

" Telescope find files
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" navbuddy
nnoremap <leader>nb <cmd>Navbuddy<cr>

silent! colorscheme onedark
