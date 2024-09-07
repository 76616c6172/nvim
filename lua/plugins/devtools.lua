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

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = false,
        pylsp = false,
      },
    },
  },
  -- configure completion shortcuts
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping.confirm({ select = true }), -- accept the currently selected item with tab
        ["<C-Space>"] = cmp.mapping.complete(), -- ctrl+space to trigger completion menu
      })
    end,
  },
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
