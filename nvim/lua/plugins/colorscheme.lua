-- [[Color Schemes]]
-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
return {
  { 'rose-pine/neovim' },
  { 'projekt0n/github-nvim-theme' },
  {
    'folke/tokyonight.nvim',
    -- priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('tokyonight').setup {
        styles = {
          comments = { italic = false },
        },
      }

      -- Load the colorscheme here.
      vim.cmd.colorscheme 'rose-pine'
    end,
  },
}
