" jamesondh .vimrc config

" General
set nocompatible
set encoding=utf8
execute pathogen#infect()
set nowrap
set backspace=indent,eol,start
set number
set showmatch
set visualbell
set noerrorbells
set title

" Indentation
set shiftwidth=4
set autoindent
set copyindent
set smarttab
filetype plugin indent on

" Theme
set t_Co=256
syntax enable
colorscheme mirodark
let g:airline_powerline_fonts = 1
let g:airline#extensions#bufferline#enabled = 1

" Search
set hlsearch
set smartcase
set incsearch
set ignorecase

" Backups & history
set history=1000
set undolevels=1000
set nobackup
set nowritebackup

" Highlight tabs, spaces, and EOL characters
set listchars=eol:¬,tab:▸\ ,extends:#,trail:·
highlight SpecialKey ctermfg=8
nmap <leader>l :set list!<CR>

" Map tab settings
nmap <leader>2 :set tabstop=2 shiftwidth=2 expandtab<CR>
nmap <leader>4 :set tabstop=4 shiftwidth=4 expandtab<CR>
nmap <leader>8 :set tabstop=8 shiftwidth=8 noexpandtab<CR>
