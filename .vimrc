" Single-quote is a comment written to be read
" Double-quotes are commented out code and can be removed or added

" General Vim Settings

" Highlight the column cursor is on
" May slow screen redraw time, so off by default
""set cursorcolumn

" Keep the bottom / top of the page n lines from the cursor
set scrolloff=5

" Persistant undo
" :help undo-persistence
set undodir=~/.vim/undodir
set undofile

" Combine vim clipboard with global clipboard buffer
" Allows using y and p to copy into CTRL-C buffer, vice versa
" :help 'clipboard'
set clipboard=unnamed
set clipboard+=unnamedplus

" Allows true colors in vim (> 8 bit colors)
" :help termguicolors
"set termguicolors

" Custom formatting based on filetype
" :help autocmd 
"" autocmd FileType yaml set tabstop=2 shiftwidth=2

" Highlight characters past column N in source files based on file type
autocmd FileType cpp,c match ErrorMsg '\%>80v.\+'
autocmd FileType cs match ErrorMsg '\%>120v.\+'

" Define function in vim to remove whitespace
fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun
"Call this on every attempt to save a file of types defined below..
autocmd BufWritePre *.cpp,*.h,*.c,*.php,*.cs,*.yml,*.txt,*.md :call TrimWhitespace()
""autocmd BufWritePre *.cpp,*.h,*.c,*.php :%s/\s\+$//ge

" Set terminal title when opening file
"" autocmd BufEnter * let &titlestring = ' ' . expand("%:t")
"" set title

" Set tabwidth=2, adjust Vim shiftwidth to the same
set tabstop=2 shiftwidth=2 

" expandtab inserts spaces instead of tabs
set expandtab 

" autindent inserts the next line at your current depth
set autoindent 

" mouse=a allows for mouse interaction with vim when supported
set mouse=a

set number

" Use Powerline symbols
""let g:airline_powerline_fonts = 1

" Enable Syntax Highlighting in Vim
syntax on
" Use Sourcerer color scheme by Xero
colorscheme sourcerer

" Fix plugin compatibility issues
set nocp
" Allow backspace to remove all types of characters
set backspace=indent,eol,start

" Set terminal title when opening file
"" autocmd BufEnter * let &titlestring = ' ' . expand("%:t")
"" set title

" Custom Vim Keybindings

" nnoremap <C-e> <C-w> " Modify and remove leading quotation
" :help mappings

" Set window jump to custom binding
" default Ctrl-W conflict - closes browser tabs
nnoremap <C-e> <C-w>

" Build and run keybinds
"" nnoremap <C-b> :!make -C build/
"nnoremap <C-b> :!cmake -S . -B ./build/ && cmake --build ./build
"nnoremap <C-d> :!./build/scrap

" Vim Plugin Settings

" set rtp+=/path/to/rtp/that/included/pathogen/vim " if needed
" Enable Pathogen plugin manager
execute pathogen#infect()
filetype plugin indent on

" Set Vim Airline theme
" base16 soda base16_pop laederon  night_owl kalisi* ayu_mirage* raven
let g:airline_theme='kalisi'

" Gitgutter installed for + -  diffs in gutters within repo files

" Ale linter settings
" Hover detail info in preview window
let g:ale_hover_to_preview = 1
" Hover detail info in balloons
""let g:ale_set_balloons = 1
let g:ale_sign_error = 'X'
let g:ale_sign_warning = '?'
""let g:ale_sign_error = '🗙'
""let g:ale_sign_warning = '⚠'
highlight ALEWarningSign ctermbg=Yellow
highlight ALEWarningSign ctermfg=Black
highlight ALEWarning ctermbg=DarkYellow
highlight ALEWarning ctermfg=White
highlight ALEErrorSign ctermbg=DarkRed
highlight ALEErrorSign ctermfg=White
highlight ALEError ctermfg=DarkRed
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)


" Colorizer plugin settings
" See :h colorizer in Vim for more info
"let g:colorizer_colornames = 0 " Don't color literal names, like red, green, etc
let g:colorizer_auto_color = 0
""let g:colorizer_skip_comments = 1
""let g:colorizer_auto_filetype ='css,html,vim'
nnoremap <C-c> :ColorToggle<CR>

" Symbols important to vim / terminal layouts

set termencoding=utf-8
set encoding=utf-8

" air-line
let g:airline_powerline_fonts = 1
 
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
 
" unicode symbols
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

" TODO: Add condition to toggle unicode / airline symbols
" By default use unicode for compatability on all systems

" airline symbols
""let g:airline_left_sep = ''
""let g:airline_left_alt_sep = ''
""let g:airline_right_sep = ''
""let g:airline_right_alt_sep = ''
""let g:airline_symbols.branch = ''
""let g:airline_symbols.readonly = ''
""let g:airline_symbols.linenr = ''


" Clang completeion settings

" If this is set, clang_complete will not be loaded at all
""let g:clang_complete_loaded=1
" Required clang library path
let g:clang_library_path=$LIBCLANG
" Clang user option settings examples
""let g:clang_user_options='-std=c++11 stdlib=libc++'
""let g:clang_user_options='-include malloc.h'

" The algo used to sort results (priority, alpha, none)
let g:clang_sort_algo="priority"
let g:clang_close_preview=1
let g:clang_jumpto_declaration_in_preview_key="\\"
let g:clang_jumpto_declaration_key="]"
let g:clang_jumpto_back_key="["

" Whether or not clang should complete preprocessor patterns
let g:clang_complete_macros=1
" Whether or not clang should complete programming paterns (for, while, etc)
let g:clang_complete_patterns=1
" Following two lines allow clang to complete patterns using snippets
let g:clang_snippets=1
" Which completion engine to use (clang_complete, ultisnips, snipmate)
let g:clang_snippets_engine='clang_complete'
" Should clang use placeholders for insertion within snippets
" This allows parameters, typenames, etc to be inserted
" Use <TAB> in normal mode to move to next param
let g:clang_trailing_placeholder=1

