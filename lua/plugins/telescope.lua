return {
  "nvim-telescope/telescope.nvim",
  keys = {
    {
      "<C-p>",
      function()
        require("telescope.builtin").find_files()
      end,
    },
    {
      "<C-g>",
      function()
        require("telescope.builtin").git_files()
      end,
    },
    {
      "<C-f>",
      function()
        require("telescope.builtin").live_grep()
      end,
    },
  },
}
