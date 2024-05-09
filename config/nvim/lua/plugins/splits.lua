return {
  "mrjones2014/smart-splits.nvim",
  opts = {

  },
  config = function ()
    vim.keymap.set("n", "<A-H>", require("smart-splits").resize_left)
    vim.keymap.set("n", "<A-J>", require("smart-splits").resize_down)
    vim.keymap.set("n", "<A-K>", require("smart-splits").resize_up)
    vim.keymap.set("n", "<A-L>", require("smart-splits").resize_right)

    -- moving between splits
    vim.keymap.set("n", "<A-h>", require("smart-splits").move_cursor_left)
    vim.keymap.set("n", "<A-j>", require("smart-splits").move_cursor_down)
    vim.keymap.set("n", "<A-k>", require("smart-splits").move_cursor_up)
    vim.keymap.set("n", "<A-l>", require("smart-splits").move_cursor_right)

    -- swapping buffers between windows
    vim.keymap.set("n", "<C-A-h>", require("smart-splits").swap_buf_left)
    vim.keymap.set("n", "<C-A-j>", require("smart-splits").swap_buf_down)
    vim.keymap.set("n", "<C-A-q>", require("smart-splits").swap_buf_up)
    vim.keymap.set("n", "<C-A-l>", require("smart-splits").swap_buf_right)

    -- creating and killing splits
    vim.keymap.set("n", "<A-'>", "<cmd>vsplit<cr><C-w>l")
    vim.keymap.set("n", "<A-5>", "<cmd>belowright split<cr>")
    vim.keymap.set("n", "<A-q>", "<cmd>wq!<cr>")
  end
}
