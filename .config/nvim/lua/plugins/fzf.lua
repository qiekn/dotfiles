---@diagnostic disable: assign-type-mismatch, missing-fields
return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local actions = require("fzf-lua.actions")
    require("fzf-lua").setup({
      defaults = {
        header = false,
        formatter = "path.filename_first",
      },
      winopts = {
        title_flags = false,
        preview = { hidden = "hidden" },
        scrollbar = false,
      },
      fzf_colors = {
        ["hl"] = { "fg", "FzfLuaFzfMatch" },
        ["hl+"] = { "fg", "FzfLuaFzfMatch" },
        ["bg+"] = { "bg", "CursorLine" },
        ["fg+"] = { "fg", "Normal" },
        ["separator"] = { "fg", "FzfLuaBorder" },
        ["scrollbar"] = { "fg", "FzfLuaBorder" },
      },
      fzf_opts = {
        ["--separator"] = "─",
      },
      actions = {
        files = {
          ["enter"] = actions.file_edit,
          ["ctrl-t"] = actions.file_tabedit,
          ["ctrl-v"] = actions.file_vsplit,
          ["ctrl-s"] = actions.file_split,
        },
      },
    })
  end,
  keys = {
    {
      "<leader>su",
      function()
        require("fzf-lua").files({
          cwd = ".",
          prompt = "> ",
        })
        --[[
        require("fzf-lua").files({
          cwd = "Source",
          prompt = "> ",
          -- stylua: ignore
          fd_opts = table.concat({
            "--type", "f",
            "--hidden",
            "--follow",
            "--exclude", "Binaries",
            "--exclude", "Intermediate",
            "--exclude", "DerivedDataCache",
            "--extension", "cpp",
            "--extension", "cc",
            "--extension", "h",
            "--extension", "hh",
          }, " "),
        })
        --]]
      end,
      desc = "[S]earch [U]nreal Source",
    },
  },
}
