syntax on
filetype plugin indent on
set number
set noswapfile
set undofile
set incsearch
set smartindent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set showmatch


call plug#begin('~/.vim/plugged')
" Sensible defaults
Plug 'tpope/vim-sensible'
Plug 'folke/which-key.nvim'
Plug 'goolord/alpha-nvim'

" File explorer
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'

" Git 
Plug 'preservim/nerdtree'
"Plug 'tpope/vim-fugitive'
Plug 'TimUntersberger/neogit'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'

" Status bar
Plug 'itchyny/lightline.vim'

"  theme
Plug 'arcticicestudio/nord-vim'
Plug 'tanvirtin/monokai.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" Programming-related
"Plug 'williamboman/mason.nvim', { 'do': ':MasonUpdate'}
"Plug 'williamboman/mason-lspconfig.nvim'
Plug 'tpope/vim-commentary'
Plug 'jpalardy/vim-slime'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'SirVer/ultisnips'
Plug 'ncm2/ncm2-ultisnips'
Plug 'mfussenegger/nvim-lint'
Plug 'mhartington/formatter.nvim'


" R-related plugins
" Plug 'jalvesaq/R-Vim-runtime', { 'for': ['r','rmd','rnoweb','quarto'] }
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'jalvesaq/Nvim-R', { 'for': ['r','rmd','rnoweb','quarto'] }
Plug 'gaalcaras/ncm-R'
Plug 'quarto-dev/quarto-nvim'
Plug 'jmbuhr/otter.nvim'

" Python-related plugins
Plug 'neovim/pynvim' 
Plug 'mtikekar/nvim-send-to-term'

" Markdown-related
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }


" LSP-related plugins
Plug 'nvim-treesitter/nvim-treesitter' , {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-calc'
Plug 'hrsh7th/cmp-emoji'
Plug 'f3fora/cmp-spell'
Plug 'kdheepak/cmp-latex-symbols'
Plug 'jc-doyle/cmp-pandoc-references'

Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-cmdline'
Plug 'VonHeikemen/lsp-zero.nvim'

" Telescope
Plug 'nvim-lua/plenary.nvim' 
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'


" Initialize plugin system
call plug#end()

autocmd FileType r inoremap <buffer> >> <Esc>:normal! a\|><CR>a 
autocmd FileType rnoweb inoremap <buffer> >> <Esc>:normal! a\|><CR>a 
autocmd FileType rmd inoremap <buffer> >> <Esc>:normal! a\|><CR>a
autocmd FileType quarto inoremap <buffer> >> <Esc>:normal! a\|><CR>a

" Enable Tab / Shift Tab to cycle completion options
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
let g:completion_enable_fuzzy_match = 1
set completeopt=menuone,noinsert,noselect

" Split windows
map <C-i> <C-W>i
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" GitLens functionality
" From  https://teukka.tech/luanvim.html
lua vim.api.nvim_command [[autocmd CursorHold  * lua require'utils'.blameVirtText()]]
lua vim.api.nvim_command [[autocmd CursorMoved * lua require'utils'.clearBlameVirtText()]]
lua vim.api.nvim_command [[autocmd CursorMovedI * lua require'utils'.clearBlameVirtText()]]

hi! link GitLens Comment


" Path specifications (https://teukka.tech/posts/vimtip-path/)
lua vim.o.path = table.concat(vim.fn.systemlist("fd . --type d"), ",")

" Mason
" lua require("mason").setup()

" nvim-tree startup

lua << EOF

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
require("nvim-tree").setup({
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true,
  },
})
EOF

"Find files using Telescope command-line sugar.
"
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

syntax on
colorscheme monokai
filetype on
filetype plugin indent on

" File browser
"
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let NERDtreeMinimalUI = 1
let NERDTreeShowHidden = 1

" Slime
"
"let g:slime_target="tmux"

let g:LanguageClient_serverCommands = {
      \ 'r': ["R', '--slave', '-e', 'languageserver::run()'"],
      \ 'python': ['pyls'],
      \ }
