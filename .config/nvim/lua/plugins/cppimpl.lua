return {
  {
    -- in header file run `:Generate implementations`
    "eriks47/generate.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      vim.api.nvim_create_user_command("CppImpl", "Generate implementations", {})
    end,
  },
}
