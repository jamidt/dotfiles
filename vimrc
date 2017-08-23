set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Themes
Plugin 'freeo/vim-kalisi'
Plugin 'mhartington/oceanic-next'
Plugin 'tomasr/molokai'
Plugin 'morhetz/gruvbox'
Plugin 'vim-scripts/wombat256.vim'
Plugin 'sickill/vim-monokai'
Plugin 'dracula/vim'
Plugin 'sjl/badwolf'
Plugin 'JBakamovic/yaflandia'

Plugin 'terryma/vim-multiple-cursors'

Plugin 'vim-airline/vim-airline'

Plugin 'Valloric/YouCompleteMe'

Plugin 'tpope/vim-fugitive'

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

Plugin 'majutsushi/tagbar'

Plugin 'ervandew/supertab'

"Plugin 'Townk/vim-autoclose'
"
Plugin 'Yggdroot/indentLine'

Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'rust-lang/rust.vim'
Plugin 'racer-rust/vim-racer'

Plugin 'editorconfig/editorconfig-vim'
call vundle#end()
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" *** General options *** """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual bell. No beeping
set vb
set noeb

" Start scrolling befor end of screen reached
set scrolloff=3

" No swapfile
set nobackup
set nowb
set noswapfile

" Tab completion
set wildmenu
set wildmode=list:longest,full

set laststatus=2

set mouse=a
"let g:clipbrdDefaultReg = '+'

" Filetype plugin support. Store filetype specific plugins in
" ~/.vim/ftplugin/ eg, as ~/.vim/ftplugin/c.vim for c specific settings.
filetype plugin on

" Restore cursor position to where it was before
augroup JumpCursorOnEdit
    au!
    autocmd BufReadPost *
        \ if expand("<afile>:p:h") !=? $TEMP |
        \   if line("'\"") > 1 && line("'\"") <= line("$") |
        \     let JumpCursorOnEdit_foo = line("'\"") |
        \     let b:doopenfold = 1 |
        \     if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
        \        let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
        \        let b:doopenfold = 2 |
        \     endif |
        \     exe JumpCursorOnEdit_foo |
        \   endif |
        \ endif
    " Need to postpone using "zv" until after reading the modelines.
    autocmd BufWinEnter *
        \ if exists("b:doopenfold") |
        \   exe "normal zv" |
        \   if(b:doopenfold > 1) |
        \       exe  "+".1 |
        \   endif |
        \   unlet b:doopenfold |
        \ endif
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" *** Programming optimizations *** """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spaces instead of tabs
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
"set shiftwidth=4

" Smartindent automatically inserts one extra level of indentation
set smartindent

" Autoindent copies the indentation from the previous line
set autoindent

set bs=2

" set linebreak
" Start a new line after 72 characters. But not automatically. Use "vip" "gq" for manual line break
set textwidth=72
set formatoptions-=t

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" *** Search *** """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight search results
set hlsearch
" Ignore case when searching...
set ignorecase
" ... unless we type capital in the search
set smartcase
" Incremental search
set incsearch

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" *** Visuals ***"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax highlighting on
syntax enable

" Highlight current line (performance slowdown)
" set cursorline

" Set numbers at the side
set relativenumber
set number

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" *** GUI options *** """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set guifont=Monospace\ 11

if has("gui_running")
    " Note this does not has to be in this block
    "set guioptions -=m
    "set guioptions -=T
    "set guioptions -=r
    "set guioptions -=b
    set guioptions=
    colorscheme molokai
    set background=dark
    set encoding=utf-8
    "let g:rehash256=1
    "let g:molokai_original=1
    "set t_Co=256
    " highlight characters that are over the line length limit
    " highlight OverLength ctermbg=red ctermfg=white guibg=#592929
    " match OverLength /\%81v.\+/
    " set colorcolumn=73
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" *** Spell check *** """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufRead,BufNewFile *.tex setlocal spell spelllang=en

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" *** Plugin configurations *** """""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ultisnips
let g:UltiSnipsExpandTrigger       = '<c-f>'
let g:UltiSnipsListSnippets        = '<c-h>'
let g:UltiSnipsJumpForwardTrigger  = '<c-f>'
let g:UltiSnipsJumpBackwardTrigger = '<c-g>'

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" let g:tex_flavor="latex"
let g:tex_conceal = ""

" indentLine
let g:indentLine_color_term = 239
let g:indentLine_char = '¦'
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)

set listchars=tab:▸\ ,eol:¬

let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'

" clang-format
map <C-I> :py3f ~/.clang-format/clang-format.py<cr>

nmap <C-B> :CtrlPBuffer<CR>

nmap <F8> :TagbarToggle<CR>

" Select whole file
map <C-a> <esc>ggVG<CR>

" Rust format
set hidden
let g:racer_cmd = "~/.cargo/bin/racer"
" Experimental
let g:racer_experimental_completer = 1

" airline
let g:airline#extensions##tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:EditorConfig_exclude_patterns = ['fugitive://.*']
