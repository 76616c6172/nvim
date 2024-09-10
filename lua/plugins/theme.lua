return {
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  {
    -- disable useless clock on the bottom
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.sections.lualine_z = {}
    end,
  },
  -- disable bufferline
  { "akinsho/bufferline.nvim", enabled = false },
  {
    -- set to og github dark theme
    "projekt0n/github-nvim-theme",
    lazy = false,
    priority = 1000,
    config = function()
      require("github-theme").setup({
        options = {
          transparent = true,
          styles = {
            -- comments = "italic",
            -- keywords = "bold",
            -- types = "italic,bold",
          },
        },
      })
      --vim.cmd("colorscheme github_dark_dimmed")
      vim.cmd("colorscheme github_dark_default")
      -- defer cursor highlight setting to ensure it's applied after everything
      vim.api.nvim_set_hl(0, "Cursor", { fg = "#000000", bg = "#00FF00" })
      -- vim.defer_fn(function()
      --   vim.api.nvim_set_hl(0, "Cursor", { fg = "#000000", bg = "#00FF00" })
      -- end, 0)
    end,
  },
}
