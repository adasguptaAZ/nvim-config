
call plug#begin('~/.vim/plugged')
" Sensible defaults
" Plug 'tpope/vim-sensible'
" Plug 'folke/which-key.nvim'
" Plug 'goolord/alpha-nvim'

" File explorer
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'

" File content explorer
" Plug 'dyng/ctrlsf.vim'

" File explorer
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
" Plug 'scrooloose/nerdtree-project-plugin'

" Git 
Plug 'kdheepak/lazygit.nvim'
" Plug 'airblade/vim-gitgutter'
"Plug 'tpope/vim-fugitive'
" Plug 'TimUntersberger/neogit'

" Status bar
" Plug 'itchyny/lightline.vim'

"  theme
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
"Plug 'arcticicestudio/nord-vim'
Plug 'Mofiqul/dracula.nvim'
" Plug 'tanvirtin/monokai.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" Working with tmux
Plug 'christoomey/vim-tmux-navigator'

" Copilot
Plug 'github/copilot.vim'           " GitHub copilot
" Programming-related
"Plug 'williamboman/mason.nvim', { 'do': ':MasonUpdate'}
"Plug 'williamboman/mason-lspconfig.nvim'
Plug 'tpope/vim-commentary'
" Plug 'jpalardy/vim-slime'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'SirVer/ultisnips'
Plug 'ncm2/ncm2-ultisnips'
" Plug 'jalvesaq/vimcmdline'          "Send script lines to a REPL
Plug 'mfussenegger/nvim-lint'       "Linter
Plug 'm4xshen/autoclose.nvim'       "Matching brackets

" R-related plugins
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'jalvesaq/Nvim-R', { 'for': ['r','rmd','rnoweb','quarto'] }
Plug 'jalvesaq/cmp-nvim-r'
" Plug 'jalvesaq/zotcite'
" Plug 'jalvesaq/cmp-zotcite'
" Plug 'chrisbra/csv.vim'
Plug 'gaalcaras/ncm-R'
" Plug 'quarto-dev/quarto-nvim'
" Plug 'jmbuhr/otter.nvim'

" Python-related plugins
Plug 'neovim/pynvim' 
Plug 'mtikekar/nvim-send-to-term'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

" Markdown-related
" Plug 'godlygeek/tabular'
" Plug 'preservim/vim-markdown'
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }


" LSP-related plugins
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'ojroques/nvim-lspfuzzy'
Plug 'nvim-lua/completion-nvim'
Plug 'hrsh7th/nvim-cmp'
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
Plug 'folke/todo-comments.nvim'     " Highlight and search TODO comments
" Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Plug 'ThePrimeagen/harpoon'


" Initialize plugin system
call plug#end()

