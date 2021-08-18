autocmd vimenter * NERDTree "NERDTree always on entry
autocmd vimenter * GitGutterEnable "GitGutter always on entry
" set showcmd
" set ruler
set cursorline
set encoding=utf-8
set nocompatible "Non Vi weird configurations
set nu rnu "Reltaive line numbers
set signcolumn=yes
set clipboard=unnamedplus
syntax on "Syntax

" Indent size config
" set cindent
set tabstop=8
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab
set autoindent
" set smartindent

" Copy/paste
set pastetoggle=<f5>

" Indent line config
let g:indentLine_enabled = 1
let g:indentLine_char = '|'
let g:indentLine_fileTypeExclude = ['text', 'sh', 'help', 'terminal']
let g:indentLine_bufNameExclude = ['NERD_tree.', 'term:.']

" Comments configuration
highlight Comment cterm=italic gui=italic
