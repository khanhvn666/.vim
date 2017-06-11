set laststatus=2                                                            
set statusline+='%F'
"set t_Co=256
set nocompatible        " be iMproved, required                           
filetype off            " required

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
Plugin 'mhartington/oceanic-next'
Plugin 'tpope/vim-vinegar'
Plugin 'terryma/vim-multiple-cursors'
Bundle 'Shougo/vimproc'
Bundle 'Shougo/unite.vim'
Bundle 'matze/vim-move'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-repeat'

"Bundle 'joonty/vim-phpqa.git'

call vundle#end()            " required                                         
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'janko-m/vim-test'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
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
"map <Leader>C :Commits<CR>
"Open fzf search history
map <Leader>H :History<CR>

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

" Vim indent
let g:indentLine_color_term = 239
let g:indentLine_char = '|'
let g:indentLine_leadingSpaceChar = '-'
let g:indentLine_leadingSpaceEnabled = 1

"Default relative number
set relativenumber

nnoremap <C-n> :call NumberToggle()<cr>

"Map leader command 
nmap <leader>L :Lines<CR>

" easy motion
map <Leader> <Plug>(easymotion-prefix)

" map ctr n with nerd tree
map <C-n> :NERDTreeToggle<CR>


" Vim navigator map
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" suppress ctags version warning (since universal-ctags)
let g:easytags_suppress_ctags_warning = 1
" absolute path (/something/src/foo.txt)

"Get full path for current file
function! FullPath ()
return "pstorm " . expand("%:p")
endfunction

nnoremap   <Leader>C :VimuxPromptCommand(FullPath())  <CR>
" Auto change the directory to the current file I'm working on
"autocmd BufEnter * lcd %:p:h


colorscheme gruvbox
set background=dark

"no auto create swap file
set noswapfile

"set move line
let g:move_key_modifier = 'C'

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

"Fuzzy search motion
function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzyword#converter()],
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> / incsearch#go(<SID>config_easyfuzzymotion())

function! s:config_fuzzyall(...) abort
  return extend(copy({
  \   'converters': [
  \     incsearch#config#fuzzy#converter(),
  \     incsearch#config#fuzzyspell#converter()
  \   ],
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> z/ incsearch#go(<SID>config_fuzzyall())
noremap <silent><expr> z? incsearch#go(<SID>cjnfig_fuzzyall({'command': '?'}))
noremap <silent><expr> zg? incsearch#go(<SID>config_fuzzyall({'is_stay': 1}))
" Gif config
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
