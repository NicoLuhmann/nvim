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

if vim.g.vscode then
    local vscode = require("vscode")
else
    keymap.set("n", "<leader>qo", "<cmd>copen<CR>", { desc = "Open Quickfix" })
    keymap.set("n", "<leader>qc", "<cmd>cclose<CR>")

    keymap.set("n", "<C-w>>", ":vertical resize +10<CR>")
    keymap.set("n", "<C-w><", ":vertical resize -10<CR>")
    keymap.set("n", "<C-w>+", ":resize +10<CR>")
    keymap.set("n", "<C-w>_", ":resize -10<CR>")
    keymap.set("n", "<C-w>=", "<C-w>=")

    keymap.set("n", "<C-w>n", ":bnext<CR>", { desc = "Next buffer" })
    keymap.set("n", "<C-w>p", ":bprevious<CR>", { desc = "Previous buffer" })
    
    keymap.set("n", "<C-w>1", ":buffer 1<CR>", { desc = "Buffer 1" })
    keymap.set("n", "<C-w>2", ":buffer 2<CR>", { desc = "Buffer 2" })
    keymap.set("n", "<C-w>3", ":buffer 3<CR>", { desc = "Buffer 3" })
    keymap.set("n", "<C-w>4", ":buffer 4<CR>", { desc = "Buffer 4" })
    keymap.set("n", "<C-w>5", ":buffer 5<CR>", { desc = "Buffer 5" })
    keymap.set("n", "<C-w>6", ":buffer 6<CR>", { desc = "Buffer 6" })
    keymap.set("n", "<C-w>7", ":buffer 7<CR>", { desc = "Buffer 7" })
    keymap.set("n", "<C-w>8", ":buffer 8<CR>", { desc = "Buffer 8" })
    keymap.set("n", "<C-w>9", ":buffer 9<CR>", { desc = "Buffer 9" })

    keymap.set("n", "<C-w>x", ":bdelete<CR>", { desc = "Delete buffer (tmux-like kill)" })
    keymap.set("n", "<C-w>c", ":enew<CR>", { desc = "New empty buffer" })
end
