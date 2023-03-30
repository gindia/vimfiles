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

autocmd BufWritePre * :silent! %s/\s\+$//e
" autocmd BufWritePre * :silent! %s/\\s\\+$//e
" :%s/\s\+$//e

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
  if has('nvim')
    Plug 'nvim-lua/plenary.nvim'
    Plug 'BurntSushi/ripgrep'
    Plug 'sharkdp/fd'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
  else
    "https://github.com/junegunn/fzf/blob/master/README-VIM.md
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'bfrg/vim-qf-preview'
  endif

    Plug 'sheerun/vim-polyglot'
    Plug 'chriskempson/base16-vim'

call plug#end()

"colorscheme onedark
colorscheme base16-gigavolt

if has('nvim')
  nnoremap <leader>ff <cmd>Telescope find_files<cr>
  nnoremap <leader>fg <cmd>Telescope live_grep<cr>
  nnoremap <leader>fb <cmd>Telescope buffers<cr>
else
  nnoremap <leader>ff <cmd>FZF<cr>
endif

function! SwitchSourceHeader()
  if (expand ("%:e") == "cpp")
    find %:t:r.h
  elseif (expand ("%:e") == "h")
    find %:t:r.cpp
  endif
endfun
autocmd FileType cpp,h nmap <leader>h :call SwitchSourceHeader()<CR>

set exrc
set secure
