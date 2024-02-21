" SETTINGS------------------------------------{{{
syntax on

"general settings
set nobackup

"tab and line settings
set shiftwidth=4
set tabstop=8
set sts=4
set cursorline
" set cursorcolumn
set ai
set si
"set expandtab	"use space instead of tabs
set scrolloff=15
set nowrap		"no line wrapping
set number

"search settings
set incsearch
set ignorecase
set showmatch
set hlsearch

"show mode and commands
set showmode
set showcmd

"wildmenu auto completion menu
set wildmenu 
set wildmode=list:longest
set wildignore=*.docs,*.jpg,*.png,*.gif,*.pyc,*.exe,*.flv,*.img,*.xlsx

" }}}

" PLUGINS--------------------------------------{{{

filetype plugin indent on

call plug#begin()

Plug 'dense-analysis/ale'
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" }}}

" VIMSCRIPT-----------------------------------{{{

" Enable folding
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END


" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Set theme
set termguicolors
colo gruvbox
let g:airline_theme='gruvbox'

" }}}

" MAPPINGS---------------------------------{{{

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <C-b> :NERDTreeToggle<CR>
nnoremap <C-b> :NERDTreeToggle<CR>

"}}}

" STATUS_LINE------------------------------{{{

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2

" }}}

