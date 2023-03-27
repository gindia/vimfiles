set nocompatible
syntax enable
filetype plugin indent on

set shell=cmd

set belloff=all
set mouse=a
set termguicolors
set splitbelow
set splitright
set nohlsearch
set scrolloff=10
set sidescrolloff=10
set nowrap
set expandtab
set smarttab
set tabstop=2 shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
set shiftround
set hidden
set noswapfile
set nobackup
set nowritebackup
set nospell
set incsearch
set colorcolumn=100
set cursorline
set cursorcolumn
set autowriteall
set noshowmode
set updatetime=100
set shortmess+=c
set signcolumn=number
set nonumber
set foldmethod=marker
set wildmenu
set wildmode=full
set laststatus=2
set statusline=
set statusline+=\ %f\ %y\ %m
set statusline+=%=
set statusline+=\ %l:%p%%
"set cmdheight=2

set grepprg=rg\ --vimgrep
set grepformat^=%f:%l:%c:%m

let mapleader=" "
nnoremap <leader>w <C-w>
nnoremap <leader>x <cmd>so %<cr>
nnoremap <C-n>     <cmd>Explore<cr>

autocmd BufWritePre * :silent! %s/\\s\\+$//e

"noremap <leader>bd <cmd>silent! %bd!|e#<CR>
noremap <S-Q>      <NOP>
"noremap K <NOP>

nnoremap Y y$

inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

nnoremap <leader>j <cmd>m .+1<CR>==
nnoremap <leader>k <cmd>m .-2<CR>==

call plug#begin()
    "https://github.com/junegunn/fzf/blob/master/README-VIM.md
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'sheerun/vim-polyglot'
    Plug 'bfrg/vim-qf-preview'
    Plug 'chriskempson/base16-vim'

call plug#end()

"colorscheme onedark
colorscheme base16-ashes

nnoremap <leader>ff <cmd>FZF<cr>

set exrc
set secure
