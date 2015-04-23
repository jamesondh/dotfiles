" General
set number
set showmatch
set visualbell
set encoding=utf8
syntax enable

" Search
set hlsearch
set smartcase
set incsearch

" Backups
set nobackup
set nowritebackup

" Virtual tabstops using spaces
set shiftwidth=4
set softtabstop=4
set expandtab
" Allow toggling between local and default mode
function TabToggle()
  if &expandtab
    set shiftwidth=8
    set softtabstop=0
    set noexpandtab
  else
    set shiftwidth=4
    set softtabstop=4
    set expandtab
  endif
endfunction
nmap <F3> mz:execute TabToggle()<CR>'z

