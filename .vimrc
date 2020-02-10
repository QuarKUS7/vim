" Sekcia pre luginy
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'mileszs/ack.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'morhetz/gruvbox'
Plug 'vim-python/python-syntax'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'mhinz/vim-startify'
Plug 'ap/vim-buftabline'
call plug#end()

" =================================================
" Zapnutie farbenia podla syntaxe
syntax on

" Neokompatibilny mod s Vi
set nocompatible

" Ziaden uvodny text
set shortmess+=I

" Color shema
set background=dark
let g:gruvbox_contrast_dark = 'hard'
set termguicolors
colorscheme gruvbox

" Pocet medzier na jeden tab
set softtabstop=4
" Stlacim tab tak to da 4 medzeri
set shiftwidth=4
set expandtab
" 7 riadkov okolo kurzoru
set so=7

" Normalne spravanie backspaceu
set backspace=indent,eol,start

" Otvaranie novych splitov
set splitbelow
set splitright

" Zobraz cisla riadkov
set number
" Relativne riadkovanie
set relativenumber

" Zobrazenie statusovej liny
set laststatus=2

" Indentacia dalsieho riadku podla predosleho
set autoindent

" Podpora pre mysku
set mouse+=a

" Hladanie v modernom style
set incsearch
" Ignorovanie velkosti
set ignorecase
" Chytre vyhladavanie
set smartcase
" Vyfarbi vysledky vyhladavanie
set hlsearch

" Python syntax
let g:python_highlight_all = 1

" Otvorit nerdtree automaticky
" autocmd vimenter * NERDTree

" Otvor nerdtree
 map <C-n> :NERDTreeToggle<CR>
" Ukaz hidden files
let NERDTreeShowHidden=1
" Zavri VIM aj nerdthree ak je posledny buffer len nerdthree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") 
      \ && b:NERDTree.isTabTree()) | q | endif

" Lepsi pohyb pohyb medzi panelmi
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Startify nastaveni
let g:startify_bookmarks = [{'c': '~/.vimrc'}, {'lua': '/home/peter/Desktop/praca/lua'}, {'ng': '/home/peter/Desktop/praca/ng_cdn'}]
let g:startify_change_to_dir = 1
let g:startify_change_to_vcs_root = 0

" Buffers
set hidden
" Buffers switching
map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>  

" Vlozi prazdny riadok na enter
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" Nepouzivaj sipky!
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>
