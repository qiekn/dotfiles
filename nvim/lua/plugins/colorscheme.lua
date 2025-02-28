-- [[Color Schemes]]
-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
return {
  { "rose-pine/neovim" },
  { "projekt0n/github-nvim-theme" },
  {
    "folke/tokyonight.nvim",
    config = function()
      require("tokyonight").setup({
        styles = {
          comments = { italic = false },
        },
      })

      -- Load the colorscheme here.
      vim.cmd.colorscheme("github_dark")
    end,
  },
  {
    "xiyaowong/transparent.nvim",
    config = function()
      require("transparent").setup({
        extra_groups = { "NeoTreeNormal" },
        exclude_groups = { "CursorLine", "CursorLineNr", "NeoTreeCursorLine" },
      })
      -- require("transparent").clear_prefix("NeoTree")
      vim.cmd("TransparentEnable")
    end,
  },
}
