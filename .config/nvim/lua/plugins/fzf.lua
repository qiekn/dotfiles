---@diagnostic disable: assign-type-mismatch, missing-fields
return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local actions = require("fzf-lua.actions")
    require("fzf-lua").setup({
      defaults = {
        header = false,
        backdrop = 0,
        title_flags = false,
        -- formatter = "path.filename_first",
      },
      winopts = {
        height = 0.45, -- window height
        width = 0.80, -- window width
        row = 0.75, -- window row position (0=top, 1=bottom)
        col = 0.50, -- window col position (0=left, 1=right)
        backdrop = 100,
        title_flags = false,
        preview = { hidden = "hidden" },
      },
      fzf_colors = {
        -- [1] = true, -- auto generate other colors config
        ["bg"] = "-1",
        ["gutter"] = "-1",

        ["hl"] = { "fg", "FzfLuaFzfMatch" },
        ["hl+"] = { "fg", "FzfLuaFzfMatch" },
        ["bg+"] = { "bg", "CursorLine" },
        ["fg+"] = { "fg", "Normal" },
        ["separator"] = { "fg", "FzfLuaBorder" },
        -- ["scrollbar"] = { "fg", "CursorLine" },
      },
      fzf_opts = {
        ["--separator"] = "─",
        ["--gutter"] = " ",
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

    vim.keymap.set("n", "<esc>p", function()
      require("fzf-lua").files()
    end, { desc = "Find files" })
  end,
  keys = {
    {
      "<leader>su",
      function()
        require("fzf-lua").files({
          cwd = ".",
          prompt = "> ",
        })
      end,
      desc = "[S]earch [U]nreal Source",
    },
  },
}
