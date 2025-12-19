-- Provider are disabled to avoid loading unnecessary providers, only needed for plugins in those languages
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

-- Check if running in VSCode's Neovim extension
if vim.g.vscode then
	local vscode = require("vscode")
else
  vim.cmd.colorscheme "catppuccin"
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
	vim.o.backup = false
	vim.o.writebackup = false
	vim.o.swapfile = false
	vim.g.clipboard = {
		name = "OSC 52",
		copy = {
			["+"] = require("vim.ui.clipboard.osc52").copy("+"),
			["*"] = require("vim.ui.clipboard.osc52").copy("*"),
		},
		paste = {
			["+"] = require("vim.ui.clipboard.osc52").paste("+"),
			["*"] = require("vim.ui.clipboard.osc52").paste("*"),
		},
	}
end
