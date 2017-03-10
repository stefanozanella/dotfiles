set nocompatible


filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'rodjek/vim-puppet'
Plugin 'flazz/vim-colorschemes'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-fugitive'
Plugin 'rking/ag.vim'
Plugin 'fatih/vim-go'
Plugin 'kchmck/vim-coffee-script'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

call vundle#end()


filetype plugin indent on
filetype plugin plugin on

syntax on

set bs=2
set ts=2
set sw=2
set expandtab
set splitright
set splitbelow
set ruler
set wrap
set textwidth=80
set relativenumber

colorscheme jellybeans
set t_Co=256
set nu

" Purge from trailing whitespaces
autocmd FileType ruby,puppet,c,cpp,javascript,sql autocmd BufWritePre <buffer> :%s/\s\+$//e

" Enable JSX syntax highlighting also on normal .js files
let g:jsx_ext_required = 0
