-- File Tree & Buffer Tree
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>pv", "<cmd>Oil<cr>")

-- Move Highlighted Block     <3 Primeagen
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set("x", "K", ":m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set("x", "J", ":m '>+1<CR>gv=gv", { silent = true })

-- Copy To System Clipboard
vim.keymap.set('n', '<leader>y', '\"+y')
vim.keymap.set('v', '<leader>y', '\"+y')
vim.keymap.set('x', '<leader>y', '\"+y')

-- Disable cutting with 'x'
vim.keymap.set('n', 'x', '"_x')
vim.keymap.set('x', 'x', '"_x')

-- Disable case-sensitivity for "q", "w", and "wq"
vim.cmd("command! -nargs=0 W w")
vim.cmd("command! -nargs=0 Q q")
vim.cmd("command! -nargs=0 WQ wq")

-- Back to Previous Buffer
vim.keymap.set("n", "<leader><leader>", "<C-^>")

-- Convert ' to " in normal mode
-- BEST KEYMAP EVER!!!!!!
vim.keymap.set("n", "<leader>'", "V<cmd>s/'/\"/g<CR><C-c>")

-- Chmod this file
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
