return {
  -- Add GitHub theme with black background
  {
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
        specs = {
          github_dark = {
            -- bg = "#000000", -- Set background to black
          },
        },
      })
      vim.cmd("colorscheme github_dark_default")
    end,
  },
}
