" --- TABS ---

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" --- LINE NUMBERS ---

set relativenumber
set nu

" --- GENERAL BEHAVIOUR ---

set hidden
set noerrorbells
set nowrap
set scrolloff=8
set signcolumn=yes
set wildmode=longest,list,full

set updatetime=50

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

" -- General
Plug 'godlygeek/tabular'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-eunuch'
Plug 'ryanoasis/vim-devicons'
Plug 'yuttie/comfortable-motion.vim'
" Plug 'junegunn/goyo.vim'

" -- LuaLine
Plug 'nvim-lualine/lualine.nvim'

Plug 'kyazdani42/nvim-web-devicons'

" -- ChadTree
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

" -- Telescope
Plug 'BurntSushi/ripgrep'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'gruvbox-community/gruvbox'
Plug 'nvim-telescope/telescope-file-browser.nvim'

" Harpoon

Plug 'ThePrimeagen/harpoon'

" -- Debug
" Plug 'puremourning/vimspector'
" let g:vimspector_enable_mappings = 'HUMAN'

" -- LSP
Plug 'neovim/nvim-lspconfig'
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }


" -- Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'

" -- Fugitive (Git)
Plug 'tpope/vim-fugitive'

" -- Markdown
Plug 'plasticboy/vim-markdown'


call plug#end()

lua << END
require'lualine'.setup()
END

lua << END
local lsp = require "lspconfig"
require'lspconfig'.solargraph.setup{}
END

lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "solargraph" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
	on_attach = on_attach,
	flags = {
	  debounce_text_changes = 150,
	}
  }
end
EOF

" let g:LanguageClient_serverCommands = {
"     \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
"     \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
"     \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
"     \ 'python': ['/usr/local/bin/pyls'],
"     \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
"     \ }

" note that if you are using Plug mapping you should not use `noremap` mappings.
" nmap <F5> <Plug>(lcn-menu)
" Or map each action separately
" nmap <silent>gh <Plug>(lcn-hover)
" nmap <silent> gd <Plug>(lcn-definition)
" nmap <silent> <F2> <Plug>(lcn-rename)

" --- APPEARENCE

let g:gruvbox_contrast_dark = 'soft'
colorscheme gruvbox
highlight Normal guibg=none
set cursorline

" --- KEYMAPS ---

" -- <leader> key
let mapleader=" "
nnoremap <SPACE> <Nop>

" -- Vim config
nnoremap <leader>ve :edit $MYVIMRC<CR>
nnoremap <leader>vr :source $MYVIMRC<CR>
nnoremap <leader>vi :source $MYVIMRC<CR> :PlugInstall<CR>

" -- General behaviour
noremap <leader>w <Esc>:w<CR>                   " Write file
noremap <C-s> <Esc>:w<CR>                       " Write file
vnoremap <leader>p "_dhP"                       " Smart paste in Visual Mode
nnoremap <leader>vh :below vertical :h<CR>      " Vertical split

" -- Move around
nnoremap J <C-d>
nnoremap K <C-u>

noremap <C-j> 3<C-e>
noremap <C-k> 3<C-y>

nnoremap <Up> <C-y>
nnoremap <Down> <C-e>

" -- Resize windows with Ctrl-Arrows
nnoremap <C-Up> :resize +2<CR>
nnoremap <C-Down> :resize -2<CR>
nnoremap <C-Left> :vertical resize -2<CR>
nnoremap <C-Right> :vertical resize +2<CR>

" -- Make 'Y' behave like 'C' and 'D' (copy utill EOL)
nnoremap Y y$

" -- Moving text (by The Primeagen)
xnoremap J :move '>+1<CR>gv-gv
xnoremap K :move '<-2<CR>gv-gv
inoremap <C-j> <Esc>:m .+1<CR>==
inoremap <C-k> <Esc>:m .-2<CR>== 
nnoremap <leader>l :m .+1<CR>== 
nnoremap <leader>k :m .-2<CR>== 

" -- Undo breakpoints (by The Primeagen)
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u

" -- Jumplist mutations (by The Primeagen)
" nnoremap <expr> k(v:count > 5 ? "m'" . v:count : "") . 'k'
" nnoremap <expr> l(v:count > 5 ? "m'" . v:count : "") . 'l'

" -- Harpoon (by The Primeagen)
nnoremap mm :lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>m :lua require("harpoon.ui").toggle_quick_menu()<CR>
" you can go up and down the list, enter, delete or reorder. q and <ESC> exit and save the menu

" you also can switch to any mark without bringing up the menu, use the below with the desired mark index
nnoremap <leader>hj :lua require("harpoon.ui").nav_file(1)<CR>                  -- navigates to file 1
" you can also cycle the list in both directions

nnoremap <leader><Tab> :lua require("harpoon.ui").nav_next()<CR>                   -- navigates to next mark
nnoremap <leader><C-Tab>:lua require("harpoon.ui").nav_prev()<CR>                   -- navigates to previous mark

" -- CHADTree
nnoremap <leader>e :CHADopen<CR>

" -- Fugitive (Git)
nnoremap <leader>gs :G<CR>
nnoremap <leader>gc :GBranch<CR>
nnoremap <leader>gf :diffget //3<CR>
nnoremap <leader>gj :diffget //2<CR>

" -- Find files using Telescope command-line sugar.
nnoremap <leader>fc <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fb <cmd>Telescope file_browser<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fo <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fm <cmd>Telescope harpoon marks<cr>

""""""" OLD VIMRC

" set encoding=UTF-8
" set nocompatible      " We're running Vim, not Vi!
" syntax on             " Enable syntax highlighting
" filetype on           " Enable filetype detection
" filetype indent on    " Enable filetype-specific indenting
" filetype plugin on    " Enable filetype-specific plugins

