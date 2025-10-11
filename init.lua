-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Setup lazy.nvim
require('lazy').setup({
  spec = {
    { 'nvim-mini/mini.nvim', version = false },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000, cond = not vim.g.vscode },
    {
      "folke/flash.nvim",
      event = "VeryLazy",
      ---@type Flash.Config
      opts = {},
      -- stylua: ignore
      keys = {
        { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
        { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
        { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
        { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
        { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
      },
    }
    -- add your plugins here
  },
  rocks = {
    enabled = false,
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "catppuccin" } },
  -- automatically check for plugin updates
  checker = { enabled = false },
})

-- disable unused providers
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

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

-- Set up 'mini.deps' (customize to your liking)
require('mini.deps').setup({ path = { package = path_package } })
local add = MiniDeps.add

-- Mini.nvim plugins that work in both VSCode and terminal
require('mini.ai').setup()
require('mini.comment').setup()
require('mini.surround').setup({
  mappings = {
    add = '<leader>sa', -- Add surrounding in Normal and Visual modes
    delete = '<leader>sd', -- Delete surrounding
    find = '<leader>sf', -- Find surrounding (to the right)
    find_left = '<leader>sF', -- Find surrounding (to the left)
    highlight = '<leader>sh', -- Highlight surrounding
    replace = '<leader>sr', -- Replace surrounding
  }
})
require('mini.pairs').setup()
require('mini.splitjoin').setup()


-- Terminal-only plugins (disabled in VSCode)
if not vim.g.vscode then
  vim.cmd.colorscheme "catppuccin"
  -- Mini.nvim
  require('mini.pick').setup()
  require('mini.cursorword').setup()
  require('mini.files').setup()
  require('mini.git').setup()
  require('mini.diff').setup()
  require('mini.notify').setup()
  require('mini.icons').setup()
  require('mini.statusline').setup()
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
