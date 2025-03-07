return {
  {
    "github/copilot.vim",
    config = function()
      -- The free quota has been used up, temporarily disabled
      vim.g.copilot_enabled = false
    end,
  },
}
