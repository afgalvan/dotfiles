if !empty(glob('~/.vim/autoload/plug.vim'))
    call plug#begin()
        Plug 'neoclide/coc.nvim', {'branch': 'release'} " Languages server
        Plug 'vim-syntastic/syntastic' "Syntax
        Plug 'bfrg/vim-cpp-modern' "C/Cpp Syntax
        Plug 'sheerun/vim-polyglot' "Syntax highlighter
        Plug 'bling/vim-airline' "Status bar
        Plug 'vim-airline/vim-airline-themes' "Status bar custom
        Plug 'preservim/nerdtree' "Folder manager
        Plug 'xuyuanp/nerdtree-git-plugin' "NERDTree git status file
        Plug 'ryanoasis/vim-devicons' "NERDTree icons
        Plug 'airblade/vim-gitgutter' "NERDTree git info
        Plug 'haya14busa/incsearch.vim' "Words finder
        Plug 'Yggdroot/indentLine' "Indentation line guide
        Plug 'jiangmiao/auto-pairs' "Quotes, parenthesis, etc... autocompletation
        Plug 'preservim/nerdcommenter' "Comments automate
        Plug 'neomake/neomake' " Asynchronous linting
        "Themes
        Plug 'joshdick/onedark.vim'
        Plug 'kaicataldo/material.vim', { 'branch': 'main' }
        Plug 'ayu-theme/ayu-vim'
        Plug 'morhetz/gruvbox'
        Plug 'chriskempson/base16-vim'
    call plug#end()
endif
