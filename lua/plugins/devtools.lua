return {
  -- configure treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.highlight = { enable = true }
      opts.indent = { enable = true }
      vim.list_extend(opts.ensure_installed, {
        -- "comment", -- comments are slowing down TS bigtime, so disable for now
        "css",
        "devicetree",
        "gitcommit",
        "gitignore",
        "go",
        "python",
        "graphql",
        "nix",
        "sql",
      })
    end,
  },
  -- disable auto pairing.
  { "echasnovski/mini.pairs", enabled = false },

  ---@diagnostic disable: missing-fields
  -- lsp servers
  {
    "stevearc/conform.nvim",
    enable = true,
    -- opts = {},
  },
  {
    "neovim/nvim-lspconfig",
    enable = true,
    opts = {
      diagnostics = { virtual_text = { prefix = "icons" } },
      capabilities = {
        workspace = {
          didChangeWatchedFiles = {
            dynamicRegistration = false,
          },
        },
      },
      ---@type lspconfig.options
      servers = {
        pyright = false,
        pylsp = false,
        lua_ls = {
          -- cmd = { "/home/folke/projects/lua-language-server/bin/lua-language-server" },
          -- single_file_support = true,
          settings = {
            Lua = {
              misc = {
                -- parameters = { "--loglevel=trace" },
              },
              -- hover = { expandAlias = false },
              type = {
                castNumberToInteger = true,
              },
              diagnostics = {
                disable = { "incomplete-signature-doc", "trailing-space" },
                -- enable = false,
                groupSeverity = {
                  strong = "Warning",
                  strict = "Warning",
                },
                groupFileStatus = {
                  ["ambiguity"] = "Opened",
                  ["await"] = "Opened",
                  ["codestyle"] = "None",
                  ["duplicate"] = "Opened",
                  ["global"] = "Opened",
                  ["luadoc"] = "Opened",
                  ["redefined"] = "Opened",
                  ["strict"] = "Opened",
                  ["strong"] = "Opened",
                  ["type-check"] = "Opened",
                  ["unbalanced"] = "Opened",
                  ["unused"] = "Opened",
                },
                unusedLocalExclude = { "_*" },
              },
            },
          },
        },
      },
    },

    {
      "stevearc/conform.nvim",
      enable = false,
      -- optional = true,
      opts = {
        formatters_by_ft = {
          ["python"] = { "ruff" },
        },
        formatters = {
          dprint = {
            condition = function(_, ctx)
              return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
            end,
          },
        },
      },
    },
    {
      "mfussenegger/nvim-lint",
      opts = {
        linters_by_ft = {
          lua = { "selene", "luacheck" },
        },
        linters = {
          selene = {
            condition = function(ctx)
              local root = LazyVim.root.get({ normalize = true })
              if root ~= vim.uv.cwd() then
                return false
              end
              return vim.fs.find({ "selene.toml" }, { path = root, upward = true })[1]
            end,
          },
          luacheck = {
            condition = function(ctx)
              local root = LazyVim.root.get({ normalize = true })
              if root ~= vim.uv.cwd() then
                return false
              end
              return vim.fs.find({ ".luacheckrc" }, { path = root, upward = true })[1]
            end,
          },
        },
      },
    },
  },
  -- configure completion shortcuts
  {
    "astral-sh/ruff-lsp",
    config = function(_, opts)
      require("lspconfig").ruff_lsp.setup({
        on_attach = function(client, bufnr)
          -- disable formatting
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end,
        -- init_options = {
        -- settings = {
        -- args = { "--quiet" }, --supress "no issues found msg"
        -- },
        -- },
      })
    end,
  },
}
