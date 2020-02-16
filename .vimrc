call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree' " Filemanager
Plug 'mileszs/ack.vim' " Search cez cely projekt
Plug 'ctrlpvim/ctrlp.vim' " Vyhladavanie fileou podla mena
Plug 'morhetz/gruvbox' " Theme
Plug 'vim-python/python-syntax' " Python
Plug 'tpope/vim-fugitive' " Git
Plug 'vim-airline/vim-airline' " Airline
Plug 'mhinz/vim-startify' " Startup menu
Plug 'ap/vim-buftabline' " Buffery
Plug 'nvie/vim-flake8' " PEP8 python
Plug 'rodjek/vim-puppet' " Puppety
call plug#end()

" =================================================
" Zapnutie farbenia podla syntaxe
syntax on

" Neokompatibilny mod s Vi
set nocompatible

" Nezobrazuj mode, leno uz je v statusline
set noshowmode

" Ziaden uvodny text
set shortmess+=I

" Color schema
set background=dark
let g:gruvbox_contrast_dark = 'hard'
set termguicolors
colorscheme gruvbox

" Pocet medzier na jeden tab
set softtabstop=4
" Stlacim tab tak to da 4 medzeri
set shiftwidth=4
set expandtab
" Pocet riadkov okolo kurzoru
set so=10

" Normalne spravanie backspaceu
set backspace=indent,eol,start

" Pozicia otvorenia novych splitov
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

" Urdzuj undo historiu medzi sessnami
set undofile
set undodir=~/.vim/undo-dir

" Podpora pre mysku v normal mode iba
set mouse=n

" Z insert mod do Normal mode pomocou jj
imap jj <Esc>

" Hladanie v modernom style
set incsearch
" Ignorovanie velkosti
set ignorecase
" Chytre vyhladavanie
set smartcase
" Vyfarbi vysledky vyhladavanie
set hlsearch

" Sem ukladaj vsetky swapy
set backupdir=/tmp//
set directory=/tmp//

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

" Startify nastavenie
let g:startify_bookmarks = [{'c': '~/.vimrc'}, {'lua': '/home/peter/Desktop/praca/lua'}, {'ng': '/home/peter/Desktop/praca/ng_cdn'}]
let g:startify_change_to_dir = 1
let g:startify_change_to_vcs_root = 0

" Pouzitie hidden bufferov
set hidden
" Buffers switching
" Dalsi buffer
map gn :bn<cr>
" Predtym buffer
map gp :bp<cr>
" Zavri buffer
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
