return {
  "qiekn/todolist.nvim",
  config = function()
    require("todolist").setup({
      -- You need to manually create this file first
      target_file = "~/notes/todo.md",
      border = "single", -- single, rounded, etc.
    })
  end,
}
