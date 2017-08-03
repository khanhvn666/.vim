"allway show status line
set laststatus=2      

set nocompatible        " be iMproved, required                           

filetype off            " required

"Show full path of current file
set statusline+=%F

" set save all buffer after close vim
"set viminfo^=%

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
Plug 'junegunn/heytmux'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'terryma/vim-expand-region'
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

"get full path for current file opening
function! FullPath ()
return "pstorm " . expand("%:p")
endfunction

" Open full path file opening by phpstorm while mouse still in vim
nnoremap   <Leader>C :VimuxPromptCommand(FullPath())  <CR>

" Auto change the directory to the current file I'm working on
"autocmd BufEnter * lcd %:p:h

"theme for vim
colorscheme gruvbox
set background=dark

"no auto create swap file
set noswapfile

" haya14busa/incsearch.vim

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" highlight the current line
set cursorline

" highlight a matching [{()}] when cursor is placed on start/end character
set showmatch

" highlight tailing whitespace
set list listchars=tab:\ \ ,trail:·

" provide hjkl movements in Insert mode via the <Ctrl> modifier key
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>l

" check one time after 4s of inactivity in normal mode
set autoread 
au CursorHold * checktime    


" Ngb to jump to buffer number N 
let c = 1
while c <= 99
  execute "nnoremap " . c . "g :" . c . "b\<CR>"
  let c += 1
endwhile

" map for undo tree
map <leader>U :UndotreeToggle<CR>

" save temp file to one place
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

"set auto close tag
let g:autoclose_vim_commentmode = 1

" set airline bar background color
let g:airline_theme='base16_tomorrow'

"Leader close vim 
nmap <leader>q :q<CR>


" session management
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

"Leader session 
nnoremap <leader>so :OpenSession
nnoremap <leader>ss :SaveSession
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

"map expand highlight 
map K <Plug>(expand_region_expand)
map J <Plug>(expand_region_shrink)
