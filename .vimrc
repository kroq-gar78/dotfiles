let maplocalleader=","

set number " line numbers

" display excessive whitespace
"set list listchars=tab: ,trail: , nbsp: 

" naviagte 'display lines' instead of hard lines
" from: http://stackoverflow.com/a/8347066
noremap <silent> <Up> gk
imap <silent> <Up> <C-o>gk
noremap <silent> <Down> gj
imap <silent> <Down> <C-o>gj
noremap <silent> <home> g<home>
imap <silent> <home> <C-o>g<home>
noremap <silent> <End> g<End>
imap <silent> <End> <C-o>g<End>

" for vundle: http://unlogic.co.uk/2013/02/08/vim-as-a-python-ide/
set nocompatible
filetype off
syntax off
"filetype plugin indent on

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" let Vundle manage Vundle
" required! 
Bundle 'VundleVim/Vundle.vim'

" plugins
"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'davidhalter/jedi-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'klen/python-mode'
"Plugin 'Shougo/neocomplete.vim'
Plugin 'tpope/vim-fugitive'
"Plugin 'guns/vim-clojure-static'
"Plugin 'tpope/vim-fireplace'
"Plugin 'tpope/vim-classpath'
"Plugin 'VimClojure'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'christoomey/vim-tmux-navigator'
Plugin 'fatih/vim-go'
Plugin 'Valloric/YouCompleteMe'

" markdown/octopress
"Plugin 'tangledhelix/vim-octopress'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'mattn/emmet-vim'
"Plugin 'tpope/vim-liquid'
Plugin 'greyblake/vim-preview'
Plugin 'altercation/vim-colors-solarized'

Plugin 'chikamichi/mediawiki.vim'
Plugin 'tikhomirov/vim-glsl'
call vundle#end()
"Plugin 'tkztmk/vim-vala'
"Plugin 'farfanoide/vim-kivy'
"Plugin 'vim-latex/vim-latex'

" for vimclojure: https://github.com/sattvik/lein-tarsier
" also from: http://regretful.ly/clojure/2012/10/28/my-vimclojure-cheatsheet/
"syntax on
"filetype plugin indent on
let vimclojure#WantNailgun = 1
let vimclojure#NailgunClient = "/home/kroq-gar78/bin/ng"
" Automatically determine indenting using fuzzy matching. e.g. the a line starting "(with-"
" will be indented two spaces.
let vimclojure#FuzzyIndent=1
" Highlight built-in functions from clojure.core and friends
let vimclojure#HighlightBuiltins=1
" Highlight functions from contrib
let vimclojure#HighlightContrib=1
" As new symbols are identified using VimClojure's dynamic features, automatically
" highlight them.
let vimclojure#DynamicHighlighting=1
" Color parens so they're easier to match visually
let vimclojure#ParenRainbow=1

augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
    augroup END


" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)

let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 0
"let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
"let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

let g:pymode_folding = 0
set nofoldenable " don't fold at the start of the program

" Use <leader>l to toggle display of whitespace
nmap <leader>l :set list!<CR>
" automatically change window's cwd to file's dir
"set autochdir

set foldmethod=indent

""Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
"" Disable AutoComplPop.
"let g:acp_enableAtStartup = 0
"" Use neocomplete.
"let g:neocomplete#enable_at_startup = 1
"" Use smartcase.
"let g:neocomplete#enable_smart_case = 1
"" Set minimum syntax keyword length.
"let g:neocomplete#sources#syntax#min_keyword_length = 3
"let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
"
"" Define dictionary.
"let g:neocomplete#sources#dictionary#dictionaries = {
"    \ 'default' : '',
"    \ 'vimshell' : $HOME.'/.vimshell_hist',
"    \ 'scheme' : $HOME.'/.gosh_completions'
"        \ }
"
"" Define keyword.
"if !exists('g:neocomplete#keyword_patterns')
"    let g:neocomplete#keyword_patterns = {}
"endif
"let g:neocomplete#keyword_patterns['default'] = '\h\w*'
"
"" Plugin key-mappings.
"inoremap <expr><C-g>     neocomplete#undo_completion()
"inoremap <expr><C-l>     neocomplete#complete_common_string()
"
"" Recommended key-mappings.
"" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
"  return neocomplete#close_popup() . "\<CR>"
"  " For no inserting <CR> key.
"  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
"endfunction
"" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y>  neocomplete#close_popup()
"inoremap <expr><C-e>  neocomplete#cancel_popup()
"" Close popup by <Space>.
""inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" from `neocomplete.txt`, allows use of jedi and neocomplete
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns={}
endif
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:neocomplete#force_omni_input_patterns.python =
\ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
" alternative pattern: '\h\w*\|[^. \t]\.\w*'

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

let g:vim_markdown_math=1
let g:vim_markdown_frontmatter=1

"Needed for LaTeX-Suite (http://vim-latex.sourceforge.net/index.php?subject=faq&title=FAQ#faq-not-loaded-vim7)
"let g:tex_flavor='latex'

syntax on

let g:airline_powerline_fonts = 1 " install airline symbols
let g:airline_theme = "luna"
let g:airline_solarized_bg = "dark"
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
set laststatus=2 " always show airline

filetype plugin indent on

"set background=dark
"colorscheme solarized

"filetype plugin on
"filetype indent on

" from http://stackoverflow.com/a/920139
vmap r "_dP

" FROM: http://stackoverflow.com/a/1878984
set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set shiftwidth=4    " Indents will have a width of 4
set softtabstop=4   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces

set autoindent

autocmd FileType html setlocal shiftwidth=2 tabstop=2 sts=2 expandtab
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 sts=2 expandtab

" LaTeX-specific stuff
"set g:Tex_CompileRule_dvi='pdflatex -interaction=nonstopmode $*'

" NERDTree macro
command NERD NERDTreeToggle

" go-vim
let g:go_version_warning = 0

" YouCompleteMe (ycm)
let g:ycm_confirm_extra_conf = 0
" TODO: change this and have a proper YCM config

" recognize more python extensions (for codewars)
au BufRead,BufNewFile *.py2 set filetype=python
au BufRead,BufNewFile *.py3 set filetype=python
