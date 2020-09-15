"Basic commands
set nocompatible "Non Vi weird configurations
set nu rnu "Reltaive line numbers
syntax on "Syntax
autocmd vimenter * NERDTree "NERDTree always on entry

call plug#begin()
Plug 'https://github.com/vim-syntastic/syntastic.git' "Syntax 
Plug 'https://github.com/bfrg/vim-cpp-modern.git' "C/Cpp Syntax
Plug 'bling/vim-airline' "Status bar
Plug 'preservim/nerdtree' "Folder manager
Plug 'sheerun/vim-polyglot' "Syntax highlighter
Plug 'haya14busa/incsearch.vim' "Words finder
Plug 'xuyuanp/nerdtree-git-plugin' "NERDTree git status file
Plug 'Yggdroot/indentLine' "Indentation line guide
Plug 'jiangmiao/auto-pairs' "Quotes, parenthesis, etc... autocompletation
Plug 'aurieh/discord.nvim', { 'do': ':UpdateRemotePlugins' } "Discord rich presence
"Plug 'anned20/vimsence' "Discord rich presence
"Plug 'severin-lemaignan/vim-minimap' "Minimap
"Theme
Plug 'joshdick/onedark.vim'
call plug#end()


"Shortcuts
let mapleader = ","
noremap <leader>qw :set shiftwidth=4
noremap <leader>f :/
noremap <leader>ft :/<cr>
noremap <leader>rt :tabnew
noremap <leader>b :NERDTree
noremap <leader>d :DiscordUpdatePresence

"Put all standard C and C++ keywords under Vim's highlight group 'Statement' (affects both C and C++ files)
let g:cpp_simple_highlight = 1
"Enable highlighting of named requirements (C++20 library concepts)
let g:cpp_named_requirements_highlight = 1

"Indent line config
let g:indentLine_enabled = 1
let g:indentLine_char = '|'
let g:indentLine_fileTypeExclude = ['text', 'sh', 'help', 'terminal']
let g:indentLine_bufNameExclude = ['NERD_tree.', 'term:.']
"Indent size config
set cindent
set tabstop=8
set autoindent
set smartindent
set shiftwidth=4

"Copy/paste
set pastetoggle=<f5>

"incsearch's required maps
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
"Remove Highlight after the search
let g:incsearch#auto_nohlsearch = 1

"Discord rich presence
let g:discord_activate_on_enter = 1

set termguicolors  " Activate true colors in terminal
colorscheme onedark  " Activate the theme
