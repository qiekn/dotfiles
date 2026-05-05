return {
  "folke/zen-mode.nvim",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    on_open = function()
      vim.cmd("hi ZenBg guibg=none")
    end,
  },
}
