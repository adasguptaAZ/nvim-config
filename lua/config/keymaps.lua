------------- FUNCTIONS -------------

P = function(x)
  print(vim.inspect(x))
  return (x)
end

RELOAD = function(...)
  return require 'plenary.reload'.reload_module(...)
end

R = function(name)
  RELOAD(name)
  return require(name)
end

local nmap = function(key, effect)
  vim.keymap.set('n', key, effect, { silent = true, noremap = true })
end

local vmap = function(key, effect)
  vim.keymap.set('v', key, effect, { silent = true, noremap = true })
end

local imap = function(key, effect)
  vim.keymap.set('i', key, effect, { silent = true, noremap = true })
end

vim.keymap.set("n", '<leader>dt', ':r ! echo "$(date -I)"<CR>', { noremap = true})
-- vim.keymap.set("n", '<leader>dt', ':r ! echo "date: $(date --iso)"<CR>', { noremap = true})
-- We'll add more stuff like this in the writing section, 
-- but I use this to quickly datestamp markdown files.

vim.keymap.set("n", '<leader>h', ':nohlsearch<CR>')
-- This is a shortcut to get rid of the highlights from your last search (/ mode)

-- Re-map Esc
imap(';;', '<Esc>')

-- Move between windows using <ctrl> direction
nmap('<C-j>', '<C-W>j')
nmap('<C-k>', '<C-W>k')
nmap('<C-h>', '<C-W>h')
nmap('<C-l>', '<C-W>l')

-- Resize window using <shift> arrow keys
nmap("<S-Up>", "<cmd>resize +2<CR>")
nmap("<S-Down>", "<cmd>resize -2<CR>")
nmap("<S-Left>", "<cmd>vertical resize -2<CR>")
nmap("<S-Right>", "<cmd>vertical resize +2<CR>")

-- maps for R
imap('>>',' |> ')

-- maps for NERDTree
nmap('<F2>',':NERDTreeToggle<CR>')

-- maps for LazyGit
nmap('gst', ':LazyGit<CR>')

-- maps for ctrlsf
imap('<C-f><C-f>', '<Plug>CtrlSFPrompt')
imap('<C-f><C-n>', '<Plug>CtrlSFCwordPath')
imap('<C-f><C-p>', '<Plug>CtrlSFPwordPath')

-- send code with ctrl+Enter
-- just like in e.g. RStudio
-- needs kitty (or other terminal) config:
-- map shift+enter send_text all \x1b[13;2u
-- map ctrl+enter send_text all \x1b[13;5u
-- nmap('<c-cr>', '<Plug>SlimeSendCell')
-- nmap('<s-cr>', '<Plug>SlimeSendCell')
-- imap('<c-cr>', '<esc><Plug>SlimeSendCell<cr>i')
-- imap('<s-cr>', '<esc><Plug>SlimeSendCell<cr>i')

-- send code with Enter and leader Enter
-- vmap('<cr>', '<Plug>SlimeRegionSend')
-- nmap('<leader><cr>', '<Plug>SlimeSendCell')


-- keep selection after indent/dedent
vmap('>', '>gv')
vmap('<', '<gv')

-- remove search highlight on esc
nmap('<esc>', '<cmd>noh<cr>')

-- find files with telescope
nmap('<c-p>', "<cmd>Telescope find_files<cr>")

-- paste and without overwriting register
vmap("<leader>p", "\"_dP")

-- delete and without overwriting register
vmap("<leader>d", "\"_d")

-- center after search and jumps
nmap('n', "nzz")
nmap('<c-d>', '<c-d>zz')
nmap('<c-u>', '<c-u>zz')

-- move between splits and tabs
nmap('<c-h>', '<c-w>h')
nmap('<c-l>', '<c-w>l')
nmap('<c-j>', '<c-w>j')
nmap('<c-k>', '<c-w>k')
nmap('H', '<cmd>tabprevious<cr>')
nmap('L', '<cmd>tabnext<cr>')

local function toggle_light_dark_theme()
  if vim.o.background == 'light' then
    vim.o.background = 'dark'
    vim.cmd [[Catppuccin mocha]]
  else
    vim.o.background = 'light'
    vim.cmd [[Catppuccin latte]]
  end
end
