return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "sharkdp/fd",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>",           desc = "File Fuzzy Finder" },
    { "<leader>g",  "<cmd>Telescope live_grep<cr>",            desc = "Live Grep" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>",              desc = "Buffer Fuzzy Finder" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>",              desc = "Buffer Fuzzy Finder" },
    { "<leader>d",  "<cmd>Telescope lsp_definitions<cr>",      desc = "View LSP Definitions" },
    { "<leader>ds", "<cmd>Telescope lsp_document_symbols<cr>", desc = "View Document Symbols" },
    { "<leader>lr", "<cmd>Telescope lsp_references<cr>",       desc = "View LSP References" },
  },
  opts = {
    defaults = {
      file_ignore_patterns = {
        "node_modules", ".git"
      }
    },
    pickers = {
      find_files = {
        hidden = true
      },
    },
    extensions = {}
  }
}
