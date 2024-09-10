-- lua/plugins/lsp.lua (or wherever your lsp settings are)
return {
  -- ensure mason.nvim is loaded and configured
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        -- optional config here
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "pyright" }, -- install pyright automatically
      })
    end,
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
    },
    ---@type lspconfig.options
    servers = {
      pyright = true,
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
}
