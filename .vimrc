set nocompatible

syntax enable
filetype plugin indent on

if has('gui_running') || &t_Co == 256
    set background=dark
    colorscheme iceberg
endif

" How text is inserted and changed
set tabstop=4 shiftwidth=4 expandtab
set autoindent
set nojoinspaces " one space after a period
set backspace=indent,eol,start
augroup filetype_indents
  autocmd!
  autocmd Filetype go,make setlocal noexpandtab
  autocmd Filetype man setlocal tabstop=8 shiftwidth=8 noexpandtab
augroup END

" How commands behave
set hlsearch incsearch
set wildmenu wildmode=longest:full,full
set nrformats-=octal
set mouse=a

" How a file is displayed
set number cursorline
set linebreak
set display+=truncate " @@@ on last screen line of a partially displayed line
set scrolloff=1 sidescrolloff=5

" How the status lines look
set laststatus=2
set ruler
set showcmd

" From defaults.vim; Q used to be a gq synonym but now enters ex mode
map Q gq

" I've hit F1 so many times when aiming for Esc; if I need help I can get it
inoremap <F1> <Esc>

map <F2> :NERDTreeToggle<CR>
map <F3> :Vista!!<CR>
" :Files from fzf.vim
map <F4> :Files<CR>

" Open all folds https://stackoverflow.com/q/8316139/1979005
augroup open_folds
  autocmd BufWinEnter * normal zR
augroup END

" https://stackoverflow.com/a/48940543/1979005
augroup highlight_whitespace
  autocmd!
  autocmd BufWinEnter <buffer> match Error /\s\+$/
  autocmd InsertEnter <buffer> match Error /\s\+\%#\@<!$/
  autocmd InsertLeave <buffer> match Error /\s\+$/
  autocmd BufWinLeave <buffer> match
augroup END

run ftplugin/man.vim

if filereadable(expand('~/.vimrc.local'))
  source '~/.vimrc.local'
endif

silent! helptags ALL
