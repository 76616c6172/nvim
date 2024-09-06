--return {
--  {
--    "hrsh7th/nvim-cmp",
--    ---@param opts cmp.ConfigSchema
--    opts = function(_, opts)
--      opts.completion = {
--        completeopt = "menu,menuone,noinsert,noselect",
--      }
--      opts.mapping = {
--        ["<Tab>"] = require("cmp").mapping.confirm({ select = true }),
--        ["<C-Space>"] = require("cmp").mapping.complete(),
--        ["<C-e>"] = require("cmp").mapping.abort(),
--      }
--      -- explicitly set the sources without "luasnip"
--      opts.sources = {
--        { name = "nvim_lsp", priority = 1000 },
--        { name = "path", priority = 750 },
--        { name = "buffer", priority = 500 },
--        { name = "nvim_lsp" },
--        -- { name = "buffer" },
--      }
--    end,
--  },
--}
--return {
--  {
--    "hrsh7th/nvim-cmp",
--    ---@param opts cmp.ConfigSchema
--    opts = function(_, opts)
--      opts.completion = {
--        completeopt = "menu,menuone,noinsert,noselect",
--      }
--      opts.mapping = {
--        ["<Tab>"] = require("cmp").mapping.confirm({ select = true }),
--        ["<C-Space>"] = require("cmp").mapping.complete(),
--        ["<C-e>"] = require("cmp").mapping.abort(),
--      }
--      -- basic source setup with LSP, buffer, and path
--      opts.sources = {
--        { name = "nvim_lsp" },
--        { name = "buffer" }, -- useful for local completions
--        { name = "path" }, -- keeps path suggestions
--      }
--    end,
--  },
--}
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        -- "cmake",
        -- "comment", -- comments are slowing down TS bigtime, so disable for now
        "css",
        "devicetree",
        "gitcommit",
        "gitignore",
        -- "glsl",
        "go",
        "python",
        "graphql",
        "http",
        -- "kconfig",
        -- "meson",
        "nix",
        "sql",
        --"wgsl",
      })
    end,
  },
  { "IndianBoy42/tree-sitter-just", event = "BufRead justfile", opts = {} },
  {
    "https://github.com/Samonitari/tree-sitter-caddy",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      opts = function(_, opts)
        require("nvim-treesitter.parsers").get_parser_configs().caddy = {
          install_info = {
            url = "https://github.com/Samonitari/tree-sitter-caddy",
            files = { "src/parser.c", "src/scanner.c" },
            branch = "master",
          },
          filetype = "caddy",
        }

        opts.ensure_installed = opts.ensure_installed or {}
        vim.list_extend(opts.ensure_installed, { "caddy" })
        vim.filetype.add({
          pattern = {
            ["Caddyfile"] = "caddy",
          },
        })
      end,
    },
    event = "BufRead Caddyfile",
  },
}
