"{{{ plugins
if empty( glob( '~/.vim/autoload/plug.vim' ) )
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do' : { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'mhinz/vim-signify' "shows git diff in signcolumn on the left side of the file
Plug 'tpope/vim-fugitive'
" make fugitive work with github
Plug 'tpope/vim-rhubarb'
" make fugitive work with bitbucket
Plug 'tommcdo/vim-fubitive'
Plug 'tommcdo/vim-fugitive-blame-ext'
Plug 'mbbill/undotree'
Plug 'morhetz/gruvbox'
call plug#end()

colorscheme gruvbox
set background=dark    " Setting dark mode

"{{{ general settings
set tabstop=4       " columns a tab counts for
set autoindent      " copy indent from current line when starting a new line
set smartindent     " automatically insert an indent after {, cinwords and some others
set softtabstop=4   " columns a tab inserts in insert mode
set shiftwidth=4    " columns inserted with the reindent operations
set shiftround      " always indent by multiple of shiftwidth
set textwidth=0 wrapmargin=0  " stop vim inserting a newline automatically
set splitbelow      " horizontal split below
set splitright      " vertical   split right
set expandtab       " always use spaces
set lazyredraw
set incsearch       " incremental search
set smartcase       " case insensitive until uppercase letter entered
set ignorecase      " in combination with smartcase actually works smart
set hlsearch        " highlight matches
set wildmenu        " visual autocomplete for the command menu
set wildmode=longest:full,full " complete longest common string, then each full match
set laststatus=2    " always display the status line
set number          " show line numbers
set relativenumber  " show relative line numbers
set mouse=a         " enable the use of mouse in all modes
set cursorline      " highlight current line
set nojoinspaces    " only one space when joining lines
set list
set listchars=tab:>-         " show tabs as >---
set completeopt+=popup       " enables popup windows (documentation bubbles)
" set completeopt+=preview   " disables ycm putting autocomplete into preview window
set updatetime=1000          " faster update for hover documentation
set ttymouse=sgr             " enable hover within tmux on macOS
set signcolumn=auto           " let the sign column always be visible
set ttimeout ttimeoutlen=100 " make vim wait less after e.g. <ESC>O
set exrc                     " load .vimrc files from the folder vim is started in
set secure                   " disables shell, autocmd and write commands from such vimrcs
set shortmess=atToOI         " :help shortmess
set sessionoptions+=folds    " sessions save folds
set foldlevelstart=10        " all folds under level 10 will be folded when file is opened
"set termguicolors            " 256b colors
set nowrap                   " don't wrap lines
set noequalalways            " don't resize when closing or opening windows
set foldcolumn=1             " show fold spans
set backspace=2              " same as ':set backspace=indent,eol,start'
set history=2250             " default is 50 lines
set virtualedit=block        " Virtual editing means that the cursor can be positioned where there is no actual character.
set showcmd                  " show size of current visual selection
set cpoptions-=a             " :read command will not set the alternate file for the current window

set backup                          " enable backups
set swapfile                        " enable swaps
set undofile
set undolevels=1000                 " number of undos
set undoreload=10000                " number of lines to save for undo
set undodir=$HOME/.vim/tmp/undo     " undo files
set backupdir=$HOME/.vim/tmp/backup " backups
set directory=$HOME/.vim/tmp/swap   " swap files
set viminfofile=$HOME/.vim/tmp/viminfo  " vim history

" Make those folders automatically if they don't already exist.
if !isdirectory( expand( &undodir   ) ) | call mkdir( expand( &undodir   ), "p" ) | endif
if !isdirectory( expand( &backupdir ) ) | call mkdir( expand( &backupdir ), "p" ) | endif
if !isdirectory( expand( &directory ) ) | call mkdir( expand( &directory ), "p" ) | endif

" copying to/from system clipboard
set clipboard^=unnamed,unnamedplus

"{{{  mappings
let mapleader=" "
"{{{ general
nnoremap <silent> <leader><leader> :edit #<CR>

nnoremap                  Q  :bd%<CR>
nnoremap          <leader>q  :quit<CR>
nnoremap <silent> <leader>s  :source ~/.vimrc<CR>
nnoremap <silent> <leader>w  :write<CR>
nnoremap <silent> <leader>p  :set wrap!<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"}}}
