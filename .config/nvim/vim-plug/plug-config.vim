" Remove Highlight after the search
let g:incsearch#auto_nohlsearch = 1
set incsearch " search as characters are entered
set hlsearch " highlights matching searcher

" Comments config
let g:NERDCompactSexyComs = 1 " Use compact syntax for prettified multi-line comments
let g:NERDTrimTrailingWhitespace = 1 " Enable trimming of trailing whitespace when uncommenting
let g:NERDSpaceDelims = 1
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
