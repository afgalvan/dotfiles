"Shortcuts
let mapleader = ","
noremap <leader>qw :set shiftwidth=4<CR>
noremap <leader>rt :tabnew<CR>
noremap <leader>b :NERDTreeToggle<CR>
noremap <leader>rr :source %:p<CR>
noremap <leader>p :PlugInstall<CR>
noremap <leader>df :%s/\<foo\>/bar/g
noremap <leader>c "+y
nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-s> :w<CR>
nnoremap <C-x> :x<CR>
nnoremap <C-q> :q<CR>
" nnoremap <C-f> :q!<CR>

" Incsearch's required maps
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
