call plug#begin('~/.vim/plugged')
" Sensible defaults
Plug 'tpope/vim-sensible'
" Plug 'folke/which-key.nvim'
" Plug 'goolord/alpha-nvim'

" File explorer
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'

" File content explorer
Plug 'dyng/ctrlsf.vim'

" File explorer
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
" Plug 'scrooloose/nerdtree-project-plugin'

" Git 
Plug 'kdheepak/lazygit.nvim'
Plug 'airblade/vim-gitgutter'
"Plug 'tpope/vim-fugitive'
" Plug 'TimUntersberger/neogit'

" Status bar
" Plug 'itchyny/lightline.vim'

"  theme
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
"Plug 'arcticicestudio/nord-vim'
" Plug 'Mofiqul/dracula.nvim'
Plug 'kyoz/purify', { 'rtp': 'vim' }
Plug 'tanvirtin/monokai.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" Working with tmux
Plug 'christoomey/vim-tmux-navigator'

" Editing
Plug 'tpope/vim-surround'
" Plug 'kylechui/nvim-surround'


" Copilot
" Plug 'github/copilot.vim'           " GitHub copilot

" Tabnine
Plug 'codota/tabnine-nvim', { 'do': './dl_binaries.sh' }

" Programming-related
Plug 'jalvesaq/vimcmdline'          "Send script lines to a REPL
Plug 'tpope/vim-commentary'         " Commenting
"Plug 'williamboman/mason.nvim', { 'do': ':MasonUpdate'}
"Plug 'williamboman/mason-lspconfig.nvim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Sending script lines to a REPL
Plug 'jpalardy/vim-slime'

" Snippets
Plug 'sirver/UltiSnips'             " Snippets
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'ncm2/ncm2-ultisnips'          " R snippets
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'honza/vim-snippets' "Snippets 
" Plug 'saadparwaiz1/cmp_luasnip'
" Plug 'L3MON4D3/LuaSnip'

Plug 'm4xshen/autoclose.nvim'       "Matching brackets

" R-related plugins
Plug 'jalvesaq/Nvim-R'
Plug 'gaalcaras/ncm-R'
Plug 'ncm2/ncm2'
Plug 'jalvesaq/cmp-nvim-r'
" Plug 'roxma/nvim-yarp'

" Citations
Plug 'jalvesaq/zotcite'
Plug 'jalvesaq/cmp-zotcite'
" Plug 'chrisbra/csv.vim'

" Quarto-related plugins
" We need quarto-nvim, otter, nvim-cmp, nvim-lspconfig, nvim-treesitter 
Plug 'quarto-dev/quarto-nvim'
Plug 'jmbuhr/otter.nvim'

" Python-related plugins
" Python folding script
Plug 'kalekundert/vim-coiled-snake'
Plug 'Konfekt/FastFold'

" Python formatting
Plug 'nvie/vim-flake8'
Plug 'psf/black', {'branch': 'stable'}
Plug 'fisadev/vim-isort'

" Load maralla autocompletor
" Plug 'maralla/completor.vim'

" Load indentLine - displays indentation guide and line
Plug 'Yggdroot/indentLine'

" Load jupytext
Plug 'GCBallesteros/jupytext.vim'

" Plug 'kana/vim-textobj-user'
" Plug 'GCBallesteros/vim-textobj-hydrogen'
" Plug 'neovim/pynvim' 
" Plug 'mtikekar/nvim-send-to-term'
" Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

" Markdown-related
" Plug 'godlygeek/tabular'
" Plug 'preservim/vim-markdown'
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }


" LSP-related plugins
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'ojroques/nvim-lspfuzzy'
" Plug 'nvim-lua/completion-nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-calc'
Plug 'hrsh7th/cmp-emoji'
Plug 'hrsh7th/cmp-omni'
" Plug 'f3fora/cmp-spell'
" Plug 'kdheepak/cmp-latex-symbols'
" Plug 'jc-doyle/cmp-pandoc-references'

" Plug 'hrsh7th/cmp-nvim-lua'
" Plug 'hrsh7th/cmp-cmdline'
" Plug 'VonHeikemen/lsp-zero.nvim'

" Telescope
Plug 'nvim-lua/plenary.nvim' 
Plug 'folke/todo-comments.nvim'     " Highlight and search TODO comments
" Plug 'nvim-lua/popup.nvim'
" Plug 'nvim-telescope/telescope.nvim', {'tag': '0.1.1'}
Plug 'nvim-telescope/telescope.nvim'
" Plug 'ThePrimeagen/harpoon'


    " NOTE: you need to install completion sources to get completions. Check
    " our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
    Plug 'ncm2/ncm2-bufword'
    Plug 'ncm2/ncm2-path'

" Initialize plugin system
call plug#end()


