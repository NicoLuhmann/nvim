-- install mini.nvim if not installed
local path_package = vim.fn.stdpath('data') .. '/site'
local mini_path = path_package .. '/pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = {
    'git', 'clone', '--filter=blob:none',
    'https://github.com/echasnovski/mini.nvim', mini_path
  }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.nvim | helptags ALL')
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

-- disable unused providers
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

-- Set leader key early
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Basic Vim Settings
vim.o.number = true
vim.o.relativenumber = true
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.smartindent = true
vim.o.wrap = false
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
vim.o.updatetime = 50
vim.o.undofile = true
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

-- Mini.nvim plugins that work in both VSCode and terminal

require('mini.ai').setup()
require('mini.comment').setup()
require('mini.surround').setup()
require('mini.pairs').setup()
require('mini.jump').setup()
require('mini.jump2d').setup()
require('mini.splitjoin').setup()

-- Terminal-only plugins (disabled in VSCode)
if not vim.g.vscode then
  require('mini.pick').setup()
  require('mini.cursorword').setup()
  require('mini.files').setup()
  require('mini.git').setup()
  require('mini.diff').setup()
  require('mini.notify').setup()
  require('mini.icons').setup()
  require('mini.statusline').setup()
  require('mini.tabline').setup()
  require('mini.starter').setup()
  require('mini.notify').setup()
  require('mini.completion').setup()
  
  -- Terminal-only keymaps
  vim.keymap.set('n', '<leader>ff', '<cmd>Pick files<cr>', { desc = 'Find files' })
  vim.keymap.set('n', '<leader>fg', '<cmd>Pick grep_live<cr>', { desc = 'Live grep' })
  vim.keymap.set('n', '<leader>fb', '<cmd>Pick buffers<cr>', { desc = 'Find buffers' })
  
  -- File explorer
  vim.keymap.set('n', '<leader>e', function()
    if not MiniFiles.close() then MiniFiles.open() end
  end, { desc = 'Toggle file explorer' })
  
end

-- Clear highlights
vim.keymap.set('n', '<esc>', "<cmd>noh<CR>")

-- Move text up and down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Move text left and right (indent/unindent)
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Replace without yanking
vim.keymap.set('x', '<leader>p', [["_dP]])

-- Delete without yanking
vim.keymap.set({'n', 'v'}, '<leader>d', [["_d]])
