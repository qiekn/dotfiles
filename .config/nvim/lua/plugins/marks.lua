return {
  "chentoast/marks.nvim",
  event = "VeryLazy",
  opts = {
    default_mappings = true,
    -- builtin_marks = { ".", "<", ">", "^" },
    builtin_marks = { "^" },
    cyclic = true,
    force_write_shada = false,
    refresh_interval = 250,
    sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
    excluded_filetypes = { "neo-tree", "lazy", "mason" },
    mappings = {},
  },
  config = function(_, opts)
    require("marks").setup(opts)
    -- disable line-number highlight on mark lines; keep only cursorline highlight
    local function clear_mark_numhl()
      vim.api.nvim_set_hl(0, "MarkSignNumHL", { link = "LineNr" })
    end
    clear_mark_numhl()
    vim.api.nvim_create_autocmd("ColorScheme", {
      group = vim.api.nvim_create_augroup("MarksNumHLOverride", { clear = true }),
      callback = clear_mark_numhl,
    })
  end,
}
