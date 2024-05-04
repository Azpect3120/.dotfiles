return {
  "ThePrimeagen/git-worktree.nvim",
  opts = {},
  config = function()
    require("telescope").load_extension("git_worktree")
  end
}
