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
        "luadoc",
        "vim",
        "vimdoc",
        "query",
        "ocaml",
        "bash",
        "tsx",
        "zig",
        "json",
        "yaml",
        "ejs",
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      autotag = { enable = true },
    })

    local parsers = require("nvim-treesitter.parsers").get_parser_configs()
    parsers.asm = {
      install_info = {
        url = "https://github.com/rush-rs/tree-sitter-asm.git",
        files = {
          "src/parser.c",
        },
        branch = "main",
      },
    }
    parsers.zig = {
      install_info = {
        url = "https://github.com/maxxnino/tree-sitter-zig.git",
        files = {
          "src/parser.c",
        },
      },
      branch = "main",
    }
    parsers.ejs = {
      install_info = {
        url = "https://github.com/tree-sitter/tree-sitter-embedded-template",
        files = {
          "src/parser.c",
        },
        requires_generate_from_grammar = true,
      },
    }
    vim.cmd('autocmd BufNewFile,BufRead .* setfiletype bash')
    vim.cmd('autocmd BufNewFile,BufRead *.ejs setfiletype html')
  end
}
