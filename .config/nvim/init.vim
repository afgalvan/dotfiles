" set showcmd
" set ruler
set cursorline
set encoding=utf-8
set nocompatible "Non Vi weird configurations
set nu rnu "Reltaive line numbers
set signcolumn=yes
set clipboard=unnamedplus
syntax on "Syntax
autocmd vimenter * NERDTree "NERDTree always on entry
autocmd vimenter * GitGutterEnable "GitGutter always on entry
" autocmd vimenter * AirlineTheme deus
" autocmd vimenter * AirlineTheme base16
autocmd vimenter * AirlineTheme gruvbox

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
Plug 'aurieh/discord.nvim', { 'do': ':UpdateRemotePlugins' } "Discord rich presence
Plug 'neomake/neomake' " Asynchronous linting
"Themes
Plug 'joshdick/onedark.vim'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'
call plug#end()

"Shortcuts
let mapleader = ","
noremap <leader>qw :set shiftwidth=4<CR>
noremap <leader>rt :tabnew<CR>
noremap <leader>b :NERDTreeToggle<CR>
noremap <leader>p :PlugInstall<CR>
noremap <leader>df :%s/\<foo\>/bar/g
noremap <leader>c "+y
nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-s> :w<CR>
nnoremap <C-x> :x<CR>
nnoremap <C-q> :q<CR>
" nnoremap <C-f> :q!<CR>

" When writing a buffer (no delay).
call neomake#configure#automake('w')
" When writing a buffer (no delay), and on normal mode changes (after 750ms).
call neomake#configure#automake('nw', 650)
" When reading a buffer (after 1s), and when writing (no delay).
call neomake#configure#automake('rw', 900)
" Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 500ms; no delay when writing).
call neomake#configure#automake('nrwi', 400)


" Put all standard C and C++ keywords under Vim's highlight group 'Statement' (affects both C and C++ files)
let g:cpp_simple_highlight = 1
" Enable highlighting of named requirements (C++20 library concepts)
let g:cpp_named_requirements_highlight = 1

" Coc-nvim configurations
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
" nmap <silent> <C-S> <Plug>(coc-range-select)
" xmap <silent> <C-S> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

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
let g:NERDSpaceDelims = 1

" THEME CONFIGURATIONS
set t_ZH=^[[3m
set t_ZR=^[[23m
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors " Activate true colors in terminal
" For Neovim 0.1.3 and 0.1.4 - https://github.com/neovim/neovim/pull/2198
if (has('nvim'))
    let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

let g:material_terminal_italics = 1
let g:material_theme_style = 'darker'

let ayucolor="mirage"
" colorscheme material
" colorscheme ayu
colorscheme gruvbox " Activate the theme
" colorscheme onedark

" Allow italic comments
highlight Comment cterm=italic
