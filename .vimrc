" download vim-plug if missing, and install plugins
if empty(glob("~/.vim/autoload/plug.vim"))
  silent! execute '!curl --create-dirs -fsSLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * silent! PlugInstall
endif

let maplocalleader=","

set number " line numbers

" display excess whitespace
"set list listchars=tab: ,trail: , nbsp: 

" navigate 'display lines' instead of hard lines
" from: http://stackoverflow.com/a/8347066
noremap <silent> <Up> gk
imap <silent> <Up> <C-o>gk
noremap <silent> <Down> gj
imap <silent> <Down> <C-o>gj
noremap <silent> <home> g<home>
imap <silent> <home> <C-o>g<home>
noremap <silent> <End> g<End>
imap <silent> <End> <C-o>g<End>

" declare plugins for vim-plug
call plug#begin()
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    "Plug 'davidhalter/jedi-vim'
    Plug 'scrooloose/nerdtree'
    Plug 'python-mode/python-mode', { 'branch': 'develop' }
    Plug 'tmhedberg/SimpylFold'
    Plug 'tpope/vim-fugitive'
    Plug 'scrooloose/nerdcommenter'
    "Plug 'christoomey/vim-tmux-navigator'
    Plug 'fatih/vim-go', { 'for': 'go' }

    " YCM is a little picky with vim versions.
    " If we're on an old vim, use an old commit of YCM
    if v:version < 801
        Plug 'Valloric/YouCompleteMe' , { 'branch': 'legacy-vim' }
    else " otherwise use master
        Plug 'Valloric/YouCompleteMe'
    endif

    " markdown
    "Plug 'tangledhelix/vim-octopress'
    Plug 'godlygeek/tabular'
    Plug 'plasticboy/vim-markdown'
    "Plug 'mattn/emmet-vim'
    "Plug 'tpope/vim-liquid'
    "Plug 'greyblake/vim-preview'
    Plug 'altercation/vim-colors-solarized'

    Plug 'chikamichi/mediawiki.vim'
    Plug 'tikhomirov/vim-glsl'
call plug#end()

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

"set foldmethod=indent
set foldcolumn=2

let g:vim_markdown_math=1
let g:vim_markdown_frontmatter=1

"Needed for LaTeX-Suite (http://vim-latex.sourceforge.net/index.php?subject=faq&title=FAQ#faq-not-loaded-vim7)
"let g:tex_flavor='latex'

let g:airline_powerline_fonts = 1 " install airline symbols
let g:airline_theme = "luna"
let g:airline_solarized_bg = "dark"
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
set laststatus=2 " always show airline

"set background=dark
"colorscheme solarized

" Replace selected text with the _ buffer in visual mode
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

" NERDTree
command NERD NERDTreeToggle
let NERDTreeIgnore=['\.pyc$']

" go-vim
let g:go_version_warning = 0

" YouCompleteMe (YCM)
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_confirm_extra_conf = 0
" TODO: change this and have a proper YCM config

" recognize more python extensions (for codewars)
au BufRead,BufNewFile *.py2 set filetype=python
au BufRead,BufNewFile *.py3 set filetype=python

" recognize custom SSH config file(s)
au BufRead,BufNewFile */.ssh/config_hosts set filetype=sshconfig
