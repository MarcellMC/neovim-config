" --- TABS ---

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" --- LINE NUMBERS ---

set relativenumber
set nu

" --- CURSOR ---

" highlight Cursor guifg=white guibg=black
" highlight iCursor guifg=white guibg=steelblue
" set guicursor=n-v-c:block-Cursor
" set guicursor+=i:ver100-iCursor
" set guicursor+=n-v-c:blinkon0
" set guicursor+=i:blinkwait10

" highlight ColorColumn ctermbg=0 guibg=lightgrey
" highlight Visual ctermbg=14 guibg=LightYellow

" --- GENERAL BEHAVIOUR ---

set hidden
set noerrorbells
set nowrap
set scrolloff=8
set signcolumn=yes
set wildmode=longest,list,full

" --- STATUS LINE ---

set statusline=
set statusline+=\ %M    " Modified flag, text is ",+" or ",-"
set statusline+=\ %y    " Type of file in the buffer, e
set statusline+=\ %r    " Readonly flag, text is "[RO]"
set statusline+=\ %F    " Full path to the file in the buffer
set statusline+=%=      " --- Right side settings
set statusline+=\ %L    " Number of lines in buffer
set statusline+=\ %p%%  " Percentage through file in lines as in |CTRL-G|
set statusline+=\ [%n]  " Buffer number

" --- SEARCH ---

set nohlsearch
set smartcase
set incsearch

" --- UNDO AND BACKUP ---

set noswapfile
set nobackup
" set undodir=~/.vim/undodir
set undofile
" set backupdir=~/.vim/backupdir

" --- LOCAL CONFIG ---

set exrc    " If the 'exrc' option is on (which is NOT the default), the current
"	directory is searched for two files.  The first that exists is used,
"	the others are ignored.
"	-  The file ".nvimrc"
"	-  The file ".exrc"

" --- PLUGINS ---

call plug#begin('~/.vim/plugged')

"" General
Plug 'godlygeek/tabular'
Plug 'jiangmiao/auto-pairs'

"" Telescope
Plug 'BurntSushi/ripgrep'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'gruvbox-community/gruvbox'

"" LSP
" Plug 'neovim/nvim-lspconfig'
" lua << EOF
" require'lspconfig'.solargraph.setup{}
" EOF


"" Fugitive (Git)
Plug 'tpope/vim-fugitive'

"" Markdown
Plug 'plasticboy/vim-markdown'

" Plug 'ryanoasis/vim-devicons'
" Plug 'tpope/vim-eunuch'
" Plug 'junegunn/goyo.vim'

" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plug 'vim-ruby/vim-ruby'
" Plug 'tpope/vim-endwise'
" Plug 'tpope/vim-rails'

call plug#end()

" --- APPEARENCE

let g:gruvbox_contrast_dark = 'soft'
colorscheme gruvbox
highlight Normal guibg=none
set cursorline

" --- KEYMAPS ---

"" <leader> key
let mapleader=" "
nnoremap <SPACE> <Nop>

"" Vim config
nnoremap <leader>ve :edit $MYVIMRC<CR>
nnoremap <leader>vr :source $MYVIMRC<CR>
nnoremap <leader>vi :source $MYVIMRC<CR> :PlugInstall<CR>

"" General behaviour
nnoremap <Up> <C-y>
nnoremap <Down> <C-e>
" vnoremap <leader>p "_dhP"
noremap <C-j> <C-e>
noremap <leader>j <C-d>
noremap <C-k> <C-y>
noremap <leader>k <C-u>
noremap <leader>s <Esc>:w<CR>

xnoremap J :move '>+1<CR>gv-gv
xnoremap K :move '<-2<CR>gv-gv

nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

"" Fugitive (Git)
nnoremap <leader>gs :G<CR>
nnoremap <leader>gc :GBranch<CR>
nnoremap <leader>gf :diffget //3<CR>
nnoremap <leader>gj :diffget //2<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


""""""" OLD VIMRC

" set encoding=UTF-8
" set nocompatible      " We're running Vim, not Vi!
" syntax on             " Enable syntax highlighting
" filetype on           " Enable filetype detection
" filetype indent on    " Enable filetype-specific indenting
" filetype plugin on    " Enable filetype-specific plugins

