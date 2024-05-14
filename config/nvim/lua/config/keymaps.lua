-- File Tree & Buffer Tree
vim.keymap.set("n", "<leader>-", "<cmd>Oil<cr>")

-- Move Highlighted Block     <3 Primeagen
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set("x", "K", ":m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set("x", "J", ":m '>+1<CR>gv=gv", { silent = true })

-- Copy To System Clipboard
vim.keymap.set('n', '<leader>y', '\"+y')
vim.keymap.set('v', '<leader>y', '\"+y')
vim.keymap.set('x', '<leader>y', '\"+y')

-- Paste From System Clipboard
vim.keymap.set({"n", "v"}, "<leader>p", "\"+p")
vim.keymap.set({"n", "v"}, "<leader>P", "\"+P")

-- Disable cutting with 'x'
vim.keymap.set({"n", "x"}, "x", "\"_x")

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

-- Source this file
vim.keymap.set("n", "<leader>xx", "<cmd>source %<CR>", { silent = true })

-- Open a terminal at the bottom of the screen with a fixed height.
vim.keymap.set("n", "<leader>st", function()
  vim.cmd.new()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 12)
  vim.wo.winfixheight = true
  vim.cmd.term()
end)
