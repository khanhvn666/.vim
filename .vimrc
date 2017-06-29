set nocompatible        " be iMproved, required                           
filetype off            " required

" set save all buffer after close vim
set viminfo^=%

" set the shell to zsh
set shell=/bin/zsh

" set the runtime path to include Vundle and initialize                         
set rtp+=~/.vim/bundle/Vundle.vim                                               
call vundle#begin() 
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'benmills/vimux'
Plugin 'Yggdroot/indentLine'
Plugin 'tpope/vim-vinegar'
Plugin 'terryma/vim-multiple-cursors'
Bundle 'matze/vim-move'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-repeat'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'easymotion/vim-easymotion'


call vundle#end()            " required                                         
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'mbbill/undotree'
Plug 'spf13/vim-autoclose'
" Initialize plugin system
call plug#end()

filetype plugin indent on    " required

" show number line
set number

" set clipboard
set clipboard=unnamedplus

"map leader key to ,
let mapleader = ","

" Prompt for a command to run
map <Leader>P :VimuxPromptCommand<CR>

"run last command executed by VimuxRunCommand
map <Leader>L :VimuxRunLastCommand<CR>

" Map for test
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" enable syntax
syntax enable

" Vim indent
let g:indentLine_color_term = 239
let g:indentLine_char = '|'
let g:indentLine_leadingSpaceChar = '-'
let g:indentLine_leadingSpaceEnabled = 1

"Default relative number
set relativenumber

"Open fzf search file
map <Leader>F :Files!<CR>
"Open fzf search commits
"map <Leader>C :Commits<CR>
"Open fzf search history
map <Leader>H :History!<CR>

"Map leader command 
nmap <leader>L :Lines!<CR>
"
"Leader buffer 
nmap <leader>B :Buffers!<CR>

" map ctr n with next buffer
map <C-n> :bn<CR>

" map ctr n with next buffer
map <C-p> :bp<CR>

" Show ranger working directory
map <leader>R :RangerWorkingDirectory<CR>.

" Vim navigator map for windown
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

https://github.com/tien-nm/.vim/blob/master/.vimrc
