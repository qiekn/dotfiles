-- [[Color Schemes]]
-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
return {
  { "rose-pine/neovim" },
  { "projekt0n/github-nvim-theme" },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "folke/tokyonight.nvim" },
  {
    "xiyaowong/transparent.nvim",
    config = function()
      -- Load the colorscheme here.
      vim.cmd.colorscheme("github_dark")
      require("transparent").setup({
        extra_groups = { "NeoTreeNormal" },
        exclude_groups = { "CursorLine", "CursorLineNr", "NeoTreeCursorLine" },
      })
      -- require("transparent").clear_prefix("NeoTree")
      vim.cmd("TransparentEnable")
    end,
  },
}
