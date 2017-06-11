set rtp+=$HOME/.local/lib/python3.5/site-packages/powerline/bindings/vim/   
set laststatus=2                                                            
"set t_Co=256
set nocompatible        " be iMproved, required                           
filetype off            " required

" set the shell to zsh
set shell=/bin/zsh

" set the runtime path to include Vundle and initialize                         
set rtp+=~/.vim/bundle/Vundle.vim                                               
call vundle#begin() 
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'wincent/command-t'
Plugin 'wincent/scalpel'
Plugin 'airblade/vim-gitgutter'
Plugin 'diepm/vim-rest-console'
Plugin 'benmills/vimux'
Plugin 'dracula/vim'
Plugin 'Yggdroot/indentLine'
Plugin 'mhartington/oceanic-next'
Plugin 'tpope/vim-vinegar'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Shougo/vimproc'
Plugin 'Shougo/unite.vim'
Plugin 'm2mdas/phpcomplete-extended'
Plugin 'shawncplus/phpcomplete.vim'

"Bundle 'joonty/vim-phpqa.git'

call vundle#end()            " required                                         
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'janko-m/vim-test'
Plug 'chriskempson/base16-vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
" Initialize plugin system
call plug#end()

filetype plugin indent on    " required

nmap ev :tabedit $MYVIMRC<CR>
map <C-n> :tabnew  "new tab
map <C-l> gt       "shortcut cho next tab
map <C-h> gT       "previous tab
set number
set clipboard=unnamedplus

"map leader key to ,
let mapleader = ","

" Prompt for a command to run
map <Leader>P :VimuxPromptCommand<CR>

"run last command executed by VimuxRunCommand
map <Leader>L :VimuxRunLastCommand<CR>
"Open fzf search file
map <Leader>F :Files<CR>
"Open fzf search commits
map <Leader>C :Commits<CR>

" Map for test
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" Theme for vim
"syntax on
"color dracula

" Theme
syntax enable
" for vim 7
set t_Co=256

" for vim 8
"if (has("termguicolors"))
"set termguicolors
"endif

colorscheme OceanicNext
let g:airline_theme='oceanicnext'

let base16colorspace=256  " Access colors present in 256 colorspace
hi Normal ctermbg=NONE

" Vim indent
let g:indentLine_color_term = 239
let g:indentLine_char = '|'

"Default relative number
set relativenumber

nnoremap <C-n> :call NumberToggle()<cr>
"Map leader command T
nmap <leader>T :CommandT<CR>

" Use <Leader>s instead of default <Leader>e:
nmap <Leader>s <Plug>(Scalpel)

" map ctr n with nerd tree
map <C-n> :NERDTreeToggle<CR>


" Vim navigator map
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" auto php suggest
autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP
