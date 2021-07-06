set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Plugin 'MatchTag'
Plugin 'Simple-Javascript-Indenter'
Plugin 'Valloric/YouCompleteMe'
Plugin 'badwolf'
Plugin 'editorconfig-vim'
Plugin 'gmarik/Vundle.vim'
Plugin 'hallison/vim-markdown'
Plugin 'kien/ctrlp.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'matchit.zip'
Plugin 'mattn/emmet-vim'
Plugin 'othree/html5-syntax.vim'
Plugin 'othree/html5.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'ruanyl/vim-fixmyjs'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

call vundle#end()
filetype plugin indent on

syntax enable
syntax on
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set nu
set autoindent
set cindent
set hlsearch
set ignorecase smartcase
set background=dark
set noswapfile
colorscheme badwolf
"colorscheme solarized
autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul

iab xtime <c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr>

filetype on
filetype plugin on
filetype indent on

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd vimenter * NERDTree
autocmd vimenter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <silent> <C-t> :NERDTreeToggle<CR>
let NERDTreeShowBookmarks=1

let g:ctrlp_custom_ignore='\v[\/](node_modules|build|target|.idea|out|.gradle|.git)$'

let g:fixmyjs_engine = 'tslint'

let g:airline#extensions#tabline#enabled = 1
nnoremap <c-h> :bprevious<CR>
nnoremap <c-l> :bnext<CR>
nnoremap <c-j> :bfirst<CR>
nnoremap <c-k> :blast<CR>
