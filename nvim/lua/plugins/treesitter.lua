return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "go",
        "css",
        "html",
        "javascript",
        "typescript",
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "ocaml",
        "bash",
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      autotag = { enable = true },
    })

    local parsers = require("nvim-treesitter.parsers").get_parser_configs()
    parsers.asm = {
      install_info = {
        url = 'https://github.com/rush-rs/tree-sitter-asm.git',
        files = {
          'src/parser.c',
        },
        branch = 'main',
      },
    }
    vim.cmd('autocmd BufNewFile,BufRead .* setfiletype bash')
  end
}
