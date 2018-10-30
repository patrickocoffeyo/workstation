set nocompatible
syntax on
filetype on
set shell=/bin/bash

" vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'airblade/vim-gitgutter'
Plugin 'austintaylor/vim-indentobject'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'django.vim'
Plugin 'fatih/vim-go'
Plugin 'joonty/vdebug'
Plugin 'Lokaltog/vim-powerline'
Plugin 'mileszs/ack.vim'
Plugin 'miripiruni/CSScomb-for-Vim'
Plugin 'majutsushi/tagbar'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'php.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'slim-template/vim-slim'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-pastie'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-vividchalk'
Plugin 'vim-scripts/Align'
Plugin 'vim-scripts/greplace.vim'
Plugin 'vim-scripts/matchit.zip'
Plugin 'jparise/vim-graphql'

call vundle#end()

" code formatting
set autoindent                                                           " automatically indent on new lines
set expandtab                                                            " expand tabs to spaces
set tabstop=8                                                            " actual tab width
set softtabstop=2                                                        " insert mode tab/backspace width
set shiftwidth=2                                                         " normal mode (auto)indent width
set backspace=2                                                          " improve the working of <BS>, <Del>, CTRL-W and CTRL-U in insert mode.

" editor setup
set autoread                                                             " reload files when they are updated
set clipboard=unnamed                                                    " use system clipboard for yanking and putting
set encoding=utf-8                                                       " define char set
set laststatus=2                                                         " always show status line
set statusline=\%L%m%r%h\ %w\ \ pwd:\ %r%{getcwd()}%h\ \ \ Line:\ %l     " fancy status line
set list                                                                 " show whitespace
set listchars=tab:→\ ,trail:·
set wildmenu                                                             " show tab completion menu
set wildmode=longest,list,full
set nowrap                                                               " no wrapping by default
set showcmd                                                              " give info on current command
set number                                                               " show line numbers
set colorcolumn=80
set hidden                                                               " hide buffers instead of unloading them
set report=0                                                             " Always report number of lines changed
set ruler                                                                " show line and column number of cursor
set cursorline                                                           " higlight screen line of the cursor
set scrolloff=4                                                          " scroll offset

" search
set ignorecase                                                           " case-insensitive search
set smartcase                                                            " case-sensitive search if query contains caps
set hlsearch                                                             " highlight search results
set incsearch                                                            " search as you type

" backup and undo files
set nobackup
set nowritebackup
set noswapfile
set backupdir=$HOME/.vim/backup
set backupcopy=yes
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
set directory=~/.vim/swap,~/tmp,.                                        " keep swp files under ~/.vim/swap
set undofile
set undodir=~/.vim/undo
set undoreload=10000

" editor styling
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

set guifont=Bitstream\ Vera\ Sans\ Mono\ 9
colorscheme Tomorrow-Night

" vdebug settings
let g:vdebug_options = {
\  "port" : 9000,
\  "server" : "192.168.88.88",
\  "timeout" : 60,
\  "on_close" : 'detach',
\  "break_on_open" : 0,
\    "ide_key" : '',
\    "debug_window_level" : 0,
\    "debug_file_level" : 0,
\    "debug_file" : "",
\    "watch_window_style" : 'compact',
\    "marker_default" : '⬦',
\    "marker_closed_tree" : '▸',
\    "marker_open_tree" : '▾',
\    "continuous_mode" : 1,
\}
let g:vdebug_features= {
\  "max_depth" : 6,
\  "max_children" : 128,
\}

" nerdtree settings.
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" vim-javascript settings.
let g:javascript_plugin_jsdoc = 1                                        " enable jsdoc
let g:javascript_plugin_flow = 1                                         " enable flow
let g:jsx_ext_required = 0

let g:go_disable_autoinstall = 0                                         " enable autoinstall for vim-go
let g:go_highlight_functions = 1                                         " turn on function highlighting for go
let g:go_highlight_methods = 1                                           " turn on method highlighting for go
let g:go_highlight_structs = 1                                           " turn on struct highlighting for go
let g:go_highlight_operators = 1                                         " turn on operators highlighting for go
let g:go_highlight_build_constraints = 1                                 " turn on build constraint highlighting for go


" key mapping
let mapleader = ','
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <leader>l :Align
nmap <leader>a :Ack<space>
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
nmap <leader>t :CtrlP<CR>
nmap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
nmap <leader>] :TagbarToggle<CR>
nmap <leader>g :GitGutterToggle<CR>
nmap <leader>c <Plug>Kwbd
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
nmap Z :tabprev<CR>
nmap X :tabnext<CR>

" just in case you forgot to sudo
cmap w!! %!sudo tee > /dev/null %

" automatically jump to last known position in a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc

" automatically clean whitespace
map <leader>s  :%s/\s\+$//<cr>:let @/=''<CR>

" filetypes
filetype plugin indent on
augroup php
  autocmd BufRead,BufNewFile *.module set filetype=php
  autocmd BufRead,BufNewFile *.install set filetype=php
  autocmd BufRead,BufNewFile *.test set filetype=php
  autocmd BufRead,BufNewFile *.inc set filetype=php
  autocmd BufRead,BufNewFile *.profile set filetype=php
  autocmd BufRead,BufNewFile *.view set filetype=php
  autocmd BufRead,BufNewFile *.fdoc set filetype=yaml
  autocmd BufRead,BufNewFile *.twig set ft=htmldjango
augroup END

augroup js
  autocmd BufRead,BufNewFile *.js set filetype=javascript.jsx syntax=javascript.jsx
  autocmd BufRead,BufNewFile *.jsx set filetype=javascript.jsx syntax=javascript.jsx
  autocmd BufRead,BufNewFile *.graphql set filetype=graphql syntax=graphql
augroup END

augroup markup
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile *.md set spell
augroup END

augroup config
  autocmd BufRead,BufNewFile *.yml set filetype=yaml
  autocmd BufRead,BufNewFile *.yml set nospell
  autocmd BufRead,BufNewFile *.yaml set filetype=yaml
  autocmd BufRead,BufNewFile *.yaml set nospell
augroup END

augroup frontend
  autocmd BufNewFile,BufRead *.less set filetype=css
  autocmd BufNewFile,BufRead *.scss set filetype=css
  autocmd BufNewFile,BufRead *.sass set filetype=css
augroup END

augroup rubylang
  autocmd BufRead,BufNewFile *.rabl set filetype=ruby
  autocmd BufRead,BufNewFile *.rb set filetype=ruby
augroup END

augroup golang
  autocmd BufRead,BufNewFile *.go set filetype=go
  autocmd FileType go set tabstop=2|set shiftwidth=2|set noexpandtab|set nolist
augroup END
