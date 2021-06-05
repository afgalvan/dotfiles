" Airline configurations
source $HOME/.config/nvim/themes/airline.vim

if (has('nvim'))
    let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

" THEME CONFIGURATIONS
" highlight Comment cterm=italic
set t_ZH=[3m
set t_ZR=[23m
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors " Activate true colors in terminal
" For Neovim 0.1.3 and 0.1.4 - https://github.com/neovim/neovim/pull/2198

let g:material_terminal_italics = 1
let g:material_theme_style = 'ocean'
let ayucolor="mirage"
" colorscheme gruvbox " Activate the theme
" colorscheme onedark
" colorscheme ayu
" colorscheme base16-default-dark
colorscheme material

" autocmd vimenter * AirlineTheme deus
" autocmd vimenter * AirlineTheme base16
" autocmd vimenter * AirlineTheme gruvbox
