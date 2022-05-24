call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree' " Filemanager
Plug 'morhetz/gruvbox' " Theme
Plug 'vim-python/python-syntax' " Python
Plug 'airblade/vim-gitgutter' " Git diff in sign column
Plug 'tpope/vim-fugitive' " Git - actual branch in airline
Plug 'vim-airline/vim-airline' " Airline
Plug 'mhinz/vim-startify' " Startup menu
Plug 'ap/vim-buftabline' " Buffery
Plug 'nvie/vim-flake8' " PEP8 python
Plug 'rodjek/vim-puppet' " Puppet
Plug 'christoomey/vim-tmux-navigator' "tmux vim
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " Go
Plug 'chr4/nginx.vim' " syntax for nginx configs
Plug 'jiangmiao/auto-pairs' " auto druha zatvorka
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'w0rp/ale'
call plug#end()
" =================================================
" Zapnutie farbenia podla syntaxe
syntax on

" Color schema
set background=dark
let g:gruvbox_contrast_dark = 'hard'
set termguicolors
colorscheme gruvbox

" Leader key
let mapleader = ','

" X sa rovna x
command W w
command Q q

" Neokompatibilny mod s Vi
set nocompatible

" Nezobrazuj mode, lebo uz je v statusline
set noshowmode

" Ziaden uvodny text
set shortmess+=I

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
"set relativenumber

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
autocmd FileType sh setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType go setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
" Vypni highlight po konci hladania
nnoremap <C-c><C-c> :noh<cr>

" Lepsi pohyb pohyb medzi panelmi
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

" Buffers switching
" Dalsi buffer
map gn :bn<cr>
" Predtym buffer
map gp :bp<cr>
" Zavri buffer
map gc :bd<cr>
" Zavri vsetky buffre, okrem aktualneho
nnoremap gC :w <bar> %bd <bar> e# <bar> bd# <CR><CR>
" Novy buffer
map ge :enew<cr>

" Vlozi prazdny riadok na enter
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" copy to system clipboard
noremap <Leader>y "+y

" Listovanie v medzi navrhmi commandov
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" ================= GitGutter nastavenie ====================
set updatetime=250
nmap eh <Plug>(GitGutterNextHunk)
nmap rh <Plug>(GitGutterPrevHunk)

" ================= NerdTree nastavenie ====================
" Otvor nerdtree
map <C-n> :NERDTreeToggle<CR>
" Ukaz hidden files
let NERDTreeShowHidden=1
" Zavri VIM aj nerdthree ak je posledny buffer len nerdthree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree")
      \ && b:NERDTree.isTabTree()) | q | endif

" Otvor nerdthree v ceste aktualneho bufferu
map <leader>a :NERDTreeFind<cr>

" =================  Startify nastavenie ===================
let g:startify_bookmarks = [{'c': '~/.vim/.vimrc'}, {'lua': '~/praca/lua'}, {'ng': '~/praca/ng_cdn'}, {'site': '~/praca/new-puppet/site'}, {'hiera': '~/praca/new-puppet/hiera/cdn'}, {'heat': '~/praca/heat'}, {'i3': '~/.config/i3/config'}]
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

" ================== FzF nastavenia =========================
" FZF :Files hladanie files
nnoremap <C-p> :Files<Cr>
nnoremap <leader>/ :Rg<cr>
" vyhladavanie v celom projekte s moznostou recur subfolderu
command! -bang -nargs=+ -complete=dir Rag call fzf#vim#ag_raw(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

" ================== CoC nastavenia =========================
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier', 'coc-eslint']

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> cy <Plug>(coc-type-definition)
nmap <silent> cr <Plug>(coc-references)
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" List problems
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>

autocmd CursorHold * silent call CocActionAsync('highlight')

"=========================================================
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

set clipboard=unnamedplus
