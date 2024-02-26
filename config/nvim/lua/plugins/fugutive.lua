return {
  "tpope/vim-fugitive",
  keys = {
    { "<leader>gs", vim.cmd.Git, desc = "Git status" },
    { "<leader>gc", "<cmd>G commit<cr>", desc = "Create git commit" },
    { "<leader>gb", "<cmd>G blame<cr>", desc = "View git blame" },
    { "<leader>gd", "<cmd>Gvdiffsplit!<cr>", desc = "Enter git merge conflict diff viewer" },
    { "<leader>dgh", "<cmd>diffget //2 <cr>", desc = "Select LEFT diff in merge conflict" },
    { "<leader>dgl", "<cmd>diffget //3 <cr>", desc = "Select RIGHT diff in merge conflict" },
    { "<leader>gp", "<cmd>G push origin " .. vim.fn.system('git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d \'\\n\'') .. "<cr>", desc = "Push current branch to origin" },
    { "<leader>gl", "<cmd>G pull origin " .. vim.fn.system('git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d \'\\n\'') .. "<cr>", desc = "Pull current branch from origin" },
  },
}
