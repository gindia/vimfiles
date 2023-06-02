set nocompatible
syntax enable
filetype plugin indent on

if has('win32')
    set shell=pwsh
    let &shellcmdflag = '-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
    let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
    let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
    set shellquote= shellxquote=
endif

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
set tabstop=4 shiftwidth=4
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
set signcolumn=no
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
noremap K <NOP>

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
        Plug 'nvim-telescope/telescope.nvim'

        " Plug 'neoclide/coc.nvim', {'branch': 'release'}
        Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
        " Plug 'mattn/webapi-vim'

        Plug 'williamboman/mason.nvim'
        Plug 'williamboman/mason-lspconfig.nvim'
        Plug 'neovim/nvim-lspconfig'

        Plug 'hrsh7th/cmp-nvim-lsp'
        Plug 'hrsh7th/cmp-buffer'
        Plug 'hrsh7th/cmp-path'
        Plug 'hrsh7th/cmp-cmdline'
        Plug 'hrsh7th/nvim-cmp'
        Plug 'hrsh7th/cmp-vsnip'
        Plug 'hrsh7th/vim-vsnip'

        Plug 'ray-x/lsp_signature.nvim'

    else
        "https://github.com/junegunn/fzf/blob/master/README-VIM.md
        Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
        Plug 'bfrg/vim-qf-preview'
    endif

    " Plug 'sheerun/vim-polyglot'
    Plug 'chriskempson/base16-vim'

    Plug 'Mofiqul/vscode.nvim'
call plug#end()

colorscheme vscode
" colorscheme zenburn
" colorscheme base16-gigavolt

if has('nvim')
    lua require('first')
endif

if has('nvim')
  nnoremap <leader>ff <cmd>Telescope find_files<cr>
  nnoremap <leader>fg <cmd>Telescope live_grep<cr>
  nnoremap <leader>fb <cmd>Telescope buffers<cr>
else
  nnoremap <leader>ff <cmd>FZF<cr>
endif

if has('nvim')
  nnoremap <leader>fw <cmd>Telescope grep_string<cr>
else
  function! FindWord()
      grep! <cword>
      botright cwindow
  endfunction
  nnoremap <leader>fw <cmd>silent! call FindWord()<cr>
endif

"use C not C++ for .h
let c_syntax_for_h=1

" function! SwitchSourceHeader()
"   if (expand ("%:e") == "c")
"     find %:t:r.h
"   elseif (expand ("%:e") == "h")
"     find %:t:r.c
"   endif
" endfun
" autocmd FileType c,h nmap <leader>h :call SwitchSourceHeader()<CR>

" nnoremap <F12> <cmd>Make<cr>

if has('nvim')
    lua require('first')
endif

set exrc
set secure

