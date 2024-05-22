return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "onsails/lspkind.nvim",
  },
  -- Config
  config = function()
    -- Neovim Development Setup
    require("neodev").setup({})

    -- Import Modules
    local lspconfig = require("lspconfig")
    local cmp = require("cmp")

    -- Define Attach Functionality
    local on_attach = function(_, bufnr)
      vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, { buffer = bufnr })
      vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end, { buffer = bufnr })
      vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, { buffer = bufnr })
      vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, { buffer = bufnr })
    end

    -- Define LSP Capabilities
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.completion.completionItem.resolveSupport = {
      properties = { "documentation", "detail", "additionalTextEdits" },
    }

    -- Define Diagnostics Handlers: Error and Warnings
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        -- Disable virtual text
        virtual_text = true,
        -- Enable gutter signs for diagnostics
        -- Letters by the line numbers. Remove because its annoying as shit
        signs = false,
        -- Enable underline for diagnostics
        underline = true,
        -- Update diagnostics in insert mode
        update_in_insert = true,
        -- Set this to the maximum number of diagnostics you want to see
        max_diagnostics = 100,
      }
    )

    -- Define Target LSP Servers
    local servers = {
      "tailwindcss",
      "html",
      "cssls",
      "tsserver",
      "clangd",
      "gopls",
      "rust_analyzer",
      "htmx",
      "jdtls",
      "pylsp",
      "bashls",
      "lua_ls",
      "sqlls",
      "ocamllsp",
      "zls",
      "asm_lsp",
      "dockerls",
    }

    -- Provide LSP List Capabilities and Attach Functionality
    for _, lsp in ipairs(servers) do
      local config = {
        on_attach = on_attach,
        capabilities = capabilities,
        single_file_support = true,
      }

      -- Some goofy 'C' setup
      if lsp == "clangd" then
        lspconfig.clangd.setup {
          on_attach = on_attach,
          capabilities = capabilities,
          cmd = { "clangd", "--offset-encoding=utf-16" },
          filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
          root_dir = require 'lspconfig'.util.root_pattern(
            ".clangd",
            ".clang-tidy",
            ".clang-format",
            "compile_commands.json",
            "compile_flags.txt",
            "configure.ac",
            ".git"
          ),
          single_file_support = true
        }
      elseif lsp == "lua_ls" then
        lspconfig.lua_ls.setup({
          capabilities = capabilities,
          on_attach = on_attach,
          settings = {
            Lua = {
              completion = {
                callSnippet = "Replace"
              },
              diagnostics = {
                globals = { "vim" }
              }
            }
          },
          single_file_support = true
        })
      elseif lsp == "asm_lsp" then
        lspconfig.asm_lsp.setup({
          capabilities = capabilities,
          on_attach = on_attach,
          filetypes = { "asm", "S", "s" },
          root_dir = function(_)
            return vim.loop.cwd()
          end
        })
      elseif lsp == "dockerls" then
        lspconfig.dockerls.setup({
          capabilities = capabilities,
          on_attach = on_attach,
          filetypes = { "Dockerfile", "dockerfile" },
          root_dir = require 'lspconfig'.util.root_pattern(
            "Dockerfile",
            ".git"
          ),
          settings = {
            docker = {
              languageserver = {
                formatter = {
                  ignoreMultilineInstructions = true,
                },
              },
            },
          },
          single_file_support = true
        })
      else
        lspconfig[lsp].setup(config)
      end
    end

    -- Completion Setup
    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },


      mapping = {
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      },
      sources = {
        { name = "nvim_lsp" }, -- LSP as the source
        { name = "tailwindcss" },
        { name = "buffer",     max_item_counts = 5 },
        { name = "copilot" },
      },
      -- Setup symbols
      formatting = {
        format = require("lspkind").cmp_format({
          mode = "symbol",
          maxwidth = 50,
          ellipsis_char = '...',
          symbol_map = {
            Copilot = "",
          },
        })
      },
    })

    -- Command Line & Search Bar Completions
    cmp.setup.cmdline("/", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" }
      }
    })

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        {
          name = "cmdline",
          option = { ignore_cmds = { "!" } },
        },
      }),
    })

    -- Enable virtual text for diagnostics
    vim.diagnostic.config({
      virtual_text = true
    })
  end
}
