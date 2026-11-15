-- [[Color Schemes]]
-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
return {
  -- ----------------------------------------------------------------------------: Themes

  { "rose-pine/neovim",                     lazy = true, },
  { "catppuccin/nvim", name = "catppuccin", lazy = true, },
  { "projekt0n/github-nvim-theme" ,         lazy = true, },
  { "folke/tokyonight.nvim",
    opts = {
      style = "night",
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
      },
    },
  },

  { -- Jonathon Blow
    "qiekn/naysayer.nvim",
    dir = vim.fn.stdpath("config") .. "/lua/local_plugins/naysayer.nvim",
    config = function ()
      vim.cmd.colorscheme("naysayer")
    end
  },

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
  --[[
  { -- Transparent background
    "xiyaowong/transparent.nvim",
    config = function()
      require("transparent").setup({
        groups = {
          -- "Normal", -- Keep colorscheme normal background
          -- "NormalNC",
          "NormalFloat",
          "SignColumn",
          "Folded",
        },
        -- Fix indent_blankline
        on_clear = function ()
          vim.schedule(function()
            if package.loaded["ibl"] then
              require("ibl").debounced_refresh(0)
            end
          end)
        end
      })

      vim.g.transparent_enabled = true
    end,
  },
  --]]
}
