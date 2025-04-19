-- Highlight todo, notes, etc in comments
return {
  { "folke/todo-comments.nvim", event = "VimEnter", dependencies = { "nvim-lua/plenary.nvim" }, opts = { signs = false } },
  {
    "danymat/neogen",
    config = true,
    keys = {
      { "<leader>nf", "<cmd>lua require('neogen').generate({ type = 'func' })<cr>", desc = "[N]eogen [F]unction" },
      { "<leader>nc", "<cmd>lua require('neogen').generate({ type = 'class' })<cr>", desc = "[N]eogen [C]lass" },
      { "<leader>nt", "<cmd>lua require('neogen').generate({ type = 'type' })<cr>", desc = "[N]eogen [T]ype" },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
