return {
  "ThePrimeagen/git-worktree.nvim",
  opts = {
    change_directory_command = "cd",
    update_on_change = true,
    update_on_change_command = "e .",
    clearjumps_on_change = true,
    autopush = false,
  },
  keys = {
    { "<leader>gw", "<cmd>Telescope git_worktree git_worktrees<cr>", desc = "Git Worktrees" },
  },
  config = function()
    require("telescope").load_extension("git_worktree")
  end
}
