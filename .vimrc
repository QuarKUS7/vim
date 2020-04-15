call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree' " Filemanager
Plug 'ctrlpvim/ctrlp.vim' " Vyhladavanie fileou podla mena
Plug 'morhetz/gruvbox' " Theme
Plug 'vim-python/python-syntax' " Python
Plug 'tpope/vim-fugitive' " Git
Plug 'vim-airline/vim-airline' " Airline
Plug 'mhinz/vim-startify' " Startup menu
Plug 'ap/vim-buftabline' " Buffery
Plug 'nvie/vim-flake8' " PEP8 python
Plug 'rodjek/vim-puppet' " Puppet
Plug 'wsdjeg/FlyGrep.vim' " FlyGrep search
Plug 'christoomey/vim-tmux-navigator' "tmux vim
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " Go
Plug 'chr4/nginx.vim' " syntax for nginx configs
Plug 'jiangmiao/auto-pairs' " auto druha zatvorka
call plug#end()
" ================================================= 
" Zapnutie farbenia podla syntaxe
syntax on

" Leader key
let mapleader = ','

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

" tab ukaze navrhy
set wildmode=longest,list
" menu pre tabove navrhy
set wildmenu

" Pouzitie hidden bufferov
set hidden
" Python syntax
let g:python_highlight_all = 1

" Lua file tab na 2 medzeri
autocmd FileType lua setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType go setlocal ts=2 sts=2 sw=2 expandtab

" FlyGrep spustenie
nnoremap <leader>/ :FlyGrep<cr>

" Vypni highlight po konci hladania
nnoremap <C-c><C-c> :noh<cr>

" Z insert mod do Normal mode pomocou jj
imap jj <Esc>

" Lepsi pohyb pohyb medzi panelmi
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Buffers switching
" Dalsi buffer
map gn :bn<cr>
" Predtym buffer
map gN :bp<cr>
" Zavri buffer
map gd :bd<cr>

" Vlozi prazdny riadok na enter
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" ================= NerdTree nastavenie ====================
" Otvor nerdtree
map <C-n> :NERDTreeToggle<CR>
" Ukaz hidden files
let NERDTreeShowHidden=1
" Zavri VIM aj nerdthree ak je posledny buffer len nerdthree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree")
      \ && b:NERDTree.isTabTree()) | q | endif

" =================  Startify nastavenie ===================
let g:startify_bookmarks = [{'c': '~/.vimrc'}, {'lua': '~/praca/lua'}, {'ng': '~/praca/ng_cdn'}, {'site': '~/praca/new-puppet/site'}, {'hiera': '~/praca/new-puppet/hiera/cdn'}, {'heat': '~/praca/heat'}]
let g:startify_change_to_dir = 1
let g:startify_change_to_vcs_root = 1

" ================== GO nastavenia =========================
" vim-go go-run na leader + p
autocmd FileType go nmap <leader>r  <Plug>(go-run)
" vim-go go-test na leader + t
autocmd FileType go nmap <leader>t  <Plug>(go-test)

" Funckcia pusti bud build alebo testcompile ak existuje test k packegu
" leader + b
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

"=========================================================
"
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
