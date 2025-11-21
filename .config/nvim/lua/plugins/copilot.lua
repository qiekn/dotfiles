return {
  --[[
  {
    "github/copilot.vim",
    config = function()
      vim.keymap.set("i", "<c-y>", 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false,
      })
      vim.g.copilot_no_tab_map = true

      -- The free quota has been used up, temporarily disabled
      -- vim.g.copilot_enabled = false
    end,
  },
  --]]
}
