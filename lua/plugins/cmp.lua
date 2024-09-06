return {
  {
    "hrsh7th/nvim-cmp",
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      opts.completion = {
        completeopt = "menu,menuone,noinsert,noselect",
      }
      opts.mapping = {
        ["<Tab>"] = require("cmp").mapping.confirm({ select = true }),
        ["<C-Space>"] = require("cmp").mapping.complete(),
        ["<C-e>"] = require("cmp").mapping.abort(),
      }
      -- other options remain the same, we're only modifying mappings
    end,
  },
}
