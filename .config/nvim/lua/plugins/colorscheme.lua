-- [[Color Schemes]]
-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
return {
  --------------
  --  Themes  --
  --------------

  { "rose-pine/neovim" },
  { "projekt0n/github-nvim-theme" },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "folke/tokyonight.nvim" },

  --------------
  --  Config  --
  --------------

  { -- Preview theme with telescope
    "andrew-george/telescope-themes",
    keys = {
      { "<leader>st", "<cmd>Telescope themes<CR>", desc = "[S]et [T]hmes" },
    },
    config = function()
      require("telescope").load_extension("themes")
    end,
  },
  { -- Transparent background
    "xiyaowong/transparent.nvim",
    config = function()
      -- Load the colorscheme here.
      vim.cmd.colorscheme("github_dark")
      require("transparent").setup({
        groups = {
          "Normal",
          "NormalNC",
          "NormalFloat",
          "SignColumn",
        },
        extra_groups = {
          "NeoTreeNormal",
          "TelescopeNormal",
          "TelescopeBorder",
          -- "TelescopeSelection",
          -- "TelescopeSelectionCaret",
        },
      })
      require("transparent").clear_prefix("Telescope")
      vim.cmd("TransparentEnable")
    end,
  },
}
