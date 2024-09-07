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
      --vim.cmd("colorscheme github_dark_default")
      vim.cmd("colorscheme github_dark_default")
    end,
  },
}
