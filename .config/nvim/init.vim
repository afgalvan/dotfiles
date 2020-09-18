set encoding=utf-8
set nocompatible "Non Vi weird configurations
set nu rnu "Reltaive line numbers
syntax on "Syntax
autocmd vimenter * NERDTree "NERDTree always on entry
autocmd vimenter * GitGutterEnable "GitGutter always on entry
autocmd vimenter * AirlineTheme deus

call plug#begin()
Plug 'https://github.com/vim-syntastic/syntastic.git' "Syntax 
Plug 'https://github.com/bfrg/vim-cpp-modern.git' "C/Cpp Syntax
Plug 'sheerun/vim-polyglot' "Syntax highlighter
Plug 'bling/vim-airline' "Status bar
Plug 'vim-airline/vim-airline-themes' "Status bar custom
Plug 'preservim/nerdtree' "Folder manager
Plug 'xuyuanp/nerdtree-git-plugin' "NERDTree git status file
Plug 'ryanoasis/vim-devicons' "NERDTree icons
Plug 'haya14busa/incsearch.vim' "Words finder
Plug 'Yggdroot/indentLine' "Indentation line guide
Plug 'jiangmiao/auto-pairs' "Quotes, parenthesis, etc... autocompletation
Plug 'preservim/nerdcommenter' "Comments automate
Plug 'aurieh/discord.nvim', { 'do': ':UpdateRemotePlugins' } "Discord rich presence
"Themes
Plug 'joshdick/onedark.vim'
Plug 'kaicataldo/material.vim', { 'branch': 'main'  }
call plug#end()


"Shortcuts
let mapleader = ","
noremap <leader>qw :set shiftwidth=4
noremap <leader>rt :tabnew<CR>
noremap <leader>b :NERDTree<CR>
noremap <leader>f /
nnoremap <C-s> :w<CR>
nnoremap <C-x> :x<CR>
nnoremap <C-Q> :q<CR>

"Put all standard C and C++ keywords under Vim's highlight group 'Statement' (affects both C and C++ files)
let g:cpp_simple_highlight = 1
"Enable highlighting of named requirements (C++20 library concepts)
let g:cpp_named_requirements_highlight = 1

" Airline customization
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" Airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

highlight Comment cterm=italic gui=italic
set t_ZH=^[[3m
set t_ZR=^[[23m

" Indent line config
let g:indentLine_enabled = 1
let g:indentLine_char = '|'
let g:indentLine_fileTypeExclude = ['text', 'sh', 'help', 'terminal']
let g:indentLine_bufNameExclude = ['NERD_tree.', 'term:.']
" Indent size config
set cindent
set tabstop=8
set autoindent
set smartindent
set shiftwidth=4

" Copy/paste
set pastetoggle=<f5>

" Incsearch's required maps
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
" Remove Highlight after the search
let g:incsearch#auto_nohlsearch = 1
set incsearch " search as characters are entered
set hlsearch " highlights matching searcher

" Comments config
let g:NERDCompactSexyComs = 1 " Use compact syntax for prettified multi-line comments
let g:NERDTrimTrailingWhitespace = 1 " Enable trimming of trailing whitespace when uncommenting

" THEME CONFIGURATIONS
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors " Activate true colors in terminal
" For Neovim 0.1.3 and 0.1.4 - https://github.com/neovim/neovim/pull/2198
if (has('nvim'))
    let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

" let g:material_terminal_italics = 1
" let g:material_theme_style = 'default'
" let g:airline_theme = 'material'

" colorscheme material
colorscheme onedark  " Activate the theme
