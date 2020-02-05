" Sekcia pre luginy
call plug#begin('~/.vim/plugged')


call plug#end()

" =================================================
" Zapnutie farbenia podla syntaxe
syntax on

" Color shema
set background=dark
colorscheme onedark

" Pocet medzier na jeden tab
set softtabstop=4
" Stlacim tab tak to da 4 medzeri
set expandtab

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

" Interactivny search a smart search ak vsetko male tak hlada len s malymi
" ak jedno velko v patterne tak aj s velkymi
set incsearch
set ignorecase
set smartcase


" Nepouzivaj sipky!
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
" inoremap <Left>  <ESC>:echoe "Use h"<CR>
" inoremap <Right> <ESC>:echoe "Use l"<CR>
" inoremap <Up>    <ESC>:echoe "Use k"<CR>
" inoremap <Down>  <ESC>:echoe "Use j"<CR>
