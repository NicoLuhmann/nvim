local keymap = vim.keymap

-- Clear highlights
keymap.set('n', '<esc>', "<cmd>noh<CR>")

-- Move text up and down
keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Move text left and right (indent/unindent)
keymap.set('v', '<', '<gv')
keymap.set('v', '>', '>gv')

-- Replace without yanking
keymap.set("v", "p", '"_dp')
keymap.set("v", "P", '"_dP')

-- Delete without yanking
keymap.set({'n', 'v'}, '<leader>d', [["_d]])

keymap.set({'n', 'v'}, '<leader>y', [["+y]])
keymap.set({'n', 'v'}, '<leader>p', [["+p]])
keymap.set({'n', 'v'}, '<leader>P', [["+P]])

keymap.set("n", "n", "nzzv", opts)
keymap.set("n", "N", "Nzzv", opts)
keymap.set("n", "*", "*zzv", opts)
keymap.set("n", "#", "#zzv", opts)
keymap.set("n", "g*", "g*zz", opts)
keymap.set("n", "g#", "g#zz", opts)
if vim.g.vscode then
    local vscode = require("vscode")
else
    keymap.set("n", "<leader>qo", "<cmd>copen<CR>", { desc = "Open Quickfix" })
    keymap.set("n", "<leader>qc", "<cmd>cclose<CR>")

    keymap.set("n", "+", ":vertical resize +5<CR>")
    keymap.set("n", "_", ":vertical resize -5<CR>")
    keymap.set("n", "=", ":resize +5<CR>")
    keymap.set("n", "-", ":resize -5<CR>")

    keymap.set("n", "<Right>", ":bnext<CR>", opts)
    keymap.set("n", "<Left>", ":bprevious<CR>", opts)
end
