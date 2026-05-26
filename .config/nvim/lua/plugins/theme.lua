-- [[Color Schemes]]
-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
return {
  -- ----------------------------------------------------------------------------: Themes

  { "rose-pine/neovim" },
  { "projekt0n/github-nvim-theme" },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
      },
    },
  },

  -- { -- Jonathon Blow
  --   "RostislavArts/naysayer.nvim",
  --   lazy = false,
  -- },

  -- ----------------------------------------------------------------------------: Config

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
      -- vim.cmd.colorscheme("github_dark")
      vim.cmd.colorscheme("tokyonight-night")

      require("transparent").setup({
        groups = {
          -- "Normal", -- Keep colorscheme normal background
          "NormalNC",
          "NormalFloat",
          "SignColumn",
          "Folded",
        },
        extra_groups = {
          -- "NeoTreeNormal",

          "TelescopeNormal",
          "TelescopeBorder",

          "TelescopePromptNormal",
          "TelescopePromptBorder",
          "TelescopePromptTitle",

          "TelescopeResultsNormal",
          "TelescopeResultsBorder",
          -- "TelescopeResultsTitle",

          "TelescopePreviewNormal",
          "TelescopePreviewBorder",
          -- "TelescopePreviewTitle",
        },
        exclude_groups = {
          "TelescopeSelection",
          "TelescopeMatching",
          "TelescopePreviewLine",
        },
      })

      vim.cmd("TransparentEnable")
    end,
  },
}
