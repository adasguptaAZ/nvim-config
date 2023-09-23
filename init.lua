-- neovim config

require('config.keymaps')
require('config.plugins')
-- require('config.global')

------- HELPERS  -------
local api, cmd, fn, g = vim.api, vim.cmd, vim.fn, vim.g
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}
local Plug = fn['plug#']

local function map(mode, lhs, rhs, opts)
local options = {noremap = true}
if opts then options = vim.tbl_extend('force', options, opts) end
  api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function opt(scope, key, value)
	scopes[scope][key] = value
	if scope ~= 'o' then scopes['o'][key] = value end
end

-------------------- PLUGINS -------------------------------

cmd [[source ~/.config/nvim/plugins.vim]]

------ OPTIONS ---------
cmd [[syntax on]]
cmd [[set autoread]]
local indent, width = 2, 80
-- cmd [[colorscheme purify]]
require('monokai').setup {}
require('monokai').setup { palette = require('monokai').pro }
require('monokai').setup { palette = require('monokai').soda }
require('monokai').setup { palette = require('monokai').ristretto }

-- vim.g.airline_theme = 'badwolf'

opt('b', 'expandtab', true)  -- Use spaces instead of tabs
opt('b', 'formatoptions', 'crqnj')        -- Automatic formatting options
opt('b', 'shiftwidth', indent)            -- Size of an indent
opt('b', 'smartindent', true)             -- Insert indents automatically
opt('b', 'tabstop', indent)               -- Number of spaces tabs count for
opt('b', 'textwidth', width)              -- Maximum width of text
-- opt('o', 'completeopt', 'menuone,noinsert,noselect')  -- Completion options
opt('o', 'hidden', true)                  -- Enable background buffers
opt('o', 'ignorecase', true)              -- Ignore case
opt('o', 'joinspaces', false)             -- No double spaces with join
opt('o', 'pastetoggle', '<F2>')           -- Paste mode
opt('o', 'scrolloff', 4 )                 -- Lines of context
opt('o', 'shiftround', true)              -- Round indent
opt('o', 'sidescrolloff', 8 )             -- Columns of context
opt('o', 'smartcase', true)               -- Don't ignore case with capitals
opt('o', 'splitbelow', true)              -- Put new windows below current
opt('o', 'splitright', true)              -- Put new windows right of current
opt('o', 'termguicolors', true)           -- True color support
opt('o', 'updatetime', 200)               -- Delay before swap file is saved
opt('o', 'wildmode', 'list:longest')      -- Command-line completion mode
opt('w', 'colorcolumn', tostring(width))  -- Line length marker
opt('w', 'cursorline', true)              -- Highlight cursor line
opt('w', 'list', true)                    -- Show some invisible characters
opt('w', 'number', true)                  -- Show line numbers
opt('w', 'relativenumber', true)          -- Relative line numbers
opt('w', 'signcolumn', 'yes')             -- Show sign column
opt('w', 'wrap', true)                    -- Enable line wrap
cmd 'set backspace=indent,eol,start'      --  let backspace delete over lines
cmd 'set ruler'                           -- Enable ruler
cmd 'set colorcolumn=80'                  -- Color the ruler
cmd 'set mouse=a'                         -- Allow mouse
cmd 'set number'
cmd 'set noswapfile'
cmd 'set showmatch'
cmd 'set incsearch'



-------------------- LSP -----------------------------------
local lsp = require('lspconfig')
local lspfuzzy = require('lspfuzzy')
for ls, cfg in pairs({
  bashls = {},
  ccls = {},
  jsonls = {},
  -- julials = {on_attach=require'completion'.on_attach},
  -- r_language_server = {on_attach=require'completion'.on_attach},
  -- pylsp = {root_dir = lsp.util.root_pattern('.git', fn.getcwd()), on_attach=require'completion'.on_attach},
}) 
  do lsp[ls].setup(cfg) 
end
lspfuzzy.setup {}
map('n', '<space>,', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
map('n', '<space>;', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
map('n', '<space>d', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
map('n', '<space>h', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', '<space>m', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<space>r', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', '<space>s', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')

-------------------- TREE-SITTER ---------------------------
local ts = require 'nvim-treesitter.configs'
ts.setup {ensure_installed = {'r','python','markdown','markdown_inline','julia','bash','yaml',
'lua','vim','query','vimdoc','latex','html','css',}, 
  highlight = {enable = true, additional_vim_regex_highlightin=false,},
  indent={enable=true},
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
    textobjects = {
    select = {
      enable = true,
      lookahead=true,
      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
        },
        }}}}


-------------------- LINTING -------------------------------

-- require('lint').linters_by_ft = {
--   python = {'pylint',}
-- }

-------------------- TODO -------------------------
-- require("todo-comments").setup {
--     -- your configuration comes here
--     -- or leave it empty to use the default settings
--     -- refer to the configuration section below
--   }

-- Setting up cmp
-- From http://neovimcraft.com/plugin/hrsh7th/nvim-cmp/index.html
local cmp = require'cmp'

cmp.setup ({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
    fn["UltiSnips#Anon"](args.body) -- for ultisnips
    -- require('luasnip').lsp_expand(args.body) -- for luasnip users
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documetation = cmp.config.window.bordered(),
  }, 
mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      -- { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })
-- require'cmp'.setup {
--   sources = {
--     { name = 'omni' }
--   }
-- }

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- IronVim
-- local iron = require("iron.core")
-- local view = require("iron.view")

-- iron.setup({
--   config = {
--     should_map_plug = false,
--     scratch_repl = true,
--     repl_definition = {
--       python = {
--         command = { "ipython" },
--         format = require("iron.fts.common").bracketed_paste,
--       },
--     },
--     repl_open_cmd = view.split.vertical("40%")
--   },
--   keymaps = {
--     send_motion = "<space>rc",
--     visual_send = "<space>rc",
--     send_file = "<space>rf",
--     exit = "<space>rq",
--     clear = "<space>rx",
--   },
-- })

-- iron.setup({
--   config = {
--     scratch_repl = true, 
--     repl_definition = {
--       sh = {
--         command = { 'zsh' }
--       },
--       python = {
--         command = { "ipython" },
--       },
--     },
--     -- repl_open_cmd = require("iron.view").right(100),
--     repl_open_cmd = view.split.vertical("40%")
--   },
--   keymaps = {
--     send_motion = "<space>rc",
--     visual_send = "<space>rc",
--     send_file = "<space>rf",
--     send_mark = "<space>rm",
--     mark_motion = "<space>rmc",
--     mark_visual = "<space>rmc",
--     remove_mark = "<space>rmd",
--     cr = "<space>r<cr>",
--     interrupt = "<space>r<space>",
--     exit = "<space>rq",
--     clear = "<space>rx"},
--   highlight = {
--     italic = true,},
--   ignore_blank_lines = true,
-- })
-- iron also has a list of commands, see :h iron-commands for all available commands
-- vim.keymap.set('n', '<space>rs', '<cmd>IronRepl<cr>')
-- vim.keymap.set('n', '<space>rr', '<cmd>IronRestart<cr>')
-- vim.keymap.set('n', '<space>rf', '<cmd>IronFocus<cr>')
-- vim.keymap.set('n', '<space>rh', '<cmd>IronHide<cr>')


-- vim-slime
-- See https://github.com/uncomfyhalomacro/erudite-vim/blob/main/lua/core/plugins/vim-slime.lua 
g.slime_target="tmux"
-- g.slime_paste_file="$HOME/.slime_paste"
-- vim.cmd([[let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.1"}]])
vim.cmd([[let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}]])

g.slime_cell_delimiter="```"
vim.keymap.set('n', '<leader>ls', '<Plug>SlimeLineSend')
vim.keymap.set('n', '<leader>cs', '<Plug>SlimeSendCell')
vim.keymap.set('n', '<leader>ps', '<Plug>SlimeParagraphSend')
vim.keymap.set('n', '<leader>gs', '<Plug>SlimeRegionSend')

-- Nvim-R 

g.R_hi_fun = 0


-- jupytext
g.jupytext_fmt = 'py'
g.jupytext_style = 'hydrogen'

cmd [[nmap \x <space>rcih/^# %%<CR><CR>]]

-- Tabnine
require('tabnine').setup({
  disable_auto_comment=true,
  accept_keymap="<C-a>",
  dismiss_keymap = "<C-]>",
  debounce_ms = 800,
  suggestion_color = {gui = "#808080", cterm = 244},
  exclude_filetypes = {"TelescopePrompt"},
  log_file_path = nil, -- absolute path to Tabnine log file
})

--------------SNIPPETS ---------------------
-- cmd [[
--   let g:UltiSnipsSnippetDirectories=["UltiSnips","snips"]]
cmd [[
  let g:UltiSnipsExpandTrigger="<Tab>"
  let g:UltiSnipsJumpForwardTrigger="<Tab>"
  let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
  let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips']
  ]]

-- Load snippets from ~/.config/nvim/LuaSnip/
-- require("luasnip.loaders.from_vscode").lazy_load({paths = {"./snips/snippets"}})
-- require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/LuaSnip/"})


