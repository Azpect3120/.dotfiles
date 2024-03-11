return {
  "kristijanhusak/vim-dadbod-ui",
  dependencies = {
    { "tpope/vim-dadbod", lazy = true },
    { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql", "psql" }, lazy = true },
  },
  cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
  keys = {
    { "<leader>db", "<cmd>DBUIToggle<cr>", desc = "Toggle the DB UI" },
    { "<leader>dba", "<cmd>DBUIAddConnection<cr>", desc = "Create a new DB connection" },
  },
}
