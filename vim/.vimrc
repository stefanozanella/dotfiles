set nocompatible


filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'flazz/vim-colorschemes'

call vundle#end()


filetype plugin indent on
filetype plugin plugin on

syntax on

set ts=2
set sw=2
set expandtab
set splitright
set splitbelow

colorscheme jellybeans
set t_Co=256
set nu
