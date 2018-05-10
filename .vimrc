" Plugin
call plug#begin()
Plug 'altercation/vim-colors-solarized'
Plug 'dense-analysis/ale'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-peekaboo'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" Theme
set background=dark
colorscheme solarized

" Editing
set autoindent
set backspace=indent,eol,start
set noesckeys
set nojoinspaces

" Formatting
set formatoptions+=2lmM
set linebreak

noremap <Leader>a :set formatoptions+=a<CR>
noremap <Leader>A :set formatoptions-=a<CR>

autocmd FileType mail setlocal formatoptions+=aw

" Spelling
set spell
set spelllang=en_gb,cjk
set spellsuggest=5

" Navigation
set mouse=a

noremap <C-d> 2<C-e>
noremap <C-e> 2<C-y>

noremap <C-f> <C-d>
noremap <C-r> <C-u>

" Display
set list
set listchars=tab:>\ ,trail:-,nbsp:+
set scrolloff=1

set diffopt+=iwhite

set number
set relativenumber
set cursorline

" Status
set wildmode=list:longest,full

let airline_theme='solarized'
let airline_solarized_bg='dark'
let airline_detect_spell=0
let airline_section_y=''

" Window
set splitbelow
set splitright

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

noremap <Up> <C-w>+
noremap <Down> <C-w>-
noremap <Left> <C-w><
noremap <Right> <C-w>>

" Search
set hlsearch
set ignorecase
set incsearch
set smartcase

noremap <silent> <Space> :nohlsearch<CR>

" Undo
noremap <C-u> <C-r>

" Command
noremap ; :
noremap : ;

" Visual
noremap v <C-v>
noremap <C-v> v

" Alignment
map ga <Plug>(EasyAlign)

" NERDTree
let NERDTreeMapActivateNode='l'
let NERDTreeMapJumpParent='h'
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1

noremap <silent> <C-n> :NERDTreeToggle<CR>

" ALE
highlight clear SignColumn

let ale_change_sign_column_color=1
let ale_lint_on_insert_leave=1
let ale_lint_on_text_changed='normal'
let ale_sign_column_always=1
