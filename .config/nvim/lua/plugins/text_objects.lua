return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  branch = "main",
  dependencies = { "nvim-treesitter/nvim-treesitter" },

  config = function()
    require("nvim-treesitter-textobjects").setup({
      select = {
        lookahead = true,
        include_surrounding_whitespace = false,
      },

      move = {
        set_jumps = true,
      },
    })

    -- ------------------------------------------------------------ Select

    local select = require("nvim-treesitter-textobjects.select")

    local function map_select(key, query)
      vim.keymap.set({ "x", "o" }, key, function()
        select.select_textobject(query, "textobjects")
      end)
    end

    map_select("af", "@function.outer")
    map_select("if", "@function.inner")

    map_select("ac", "@class.outer")
    map_select("ic", "@class.inner")

    -- ------------------------------------------------------------ Move

    local move = require("nvim-treesitter-textobjects.move")

    vim.keymap.set({ "n", "x", "o" }, "]f", function()
      move.goto_next_start("@function.outer", "textobjects")
    end)

    vim.keymap.set({ "n", "x", "o" }, "[f", function()
      move.goto_previous_start("@function.outer", "textobjects")
    end)

    vim.keymap.set({ "n", "x", "o" }, "]c", function()
      move.goto_next_start("@class.outer", "textobjects")
    end)

    vim.keymap.set({ "n", "x", "o" }, "[c", function()
      move.goto_previous_start("@class.outer", "textobjects")
    end)

    -- ------------------------------------------------------------ Repeat

    local repeat_move = require("nvim-treesitter-textobjects.repeatable_move")

    vim.keymap.set({ "n", "x", "o" }, ";", repeat_move.repeat_last_move_next)
    vim.keymap.set({ "n", "x", "o" }, ",", repeat_move.repeat_last_move_previous)

    -- Keep native f/F/t/T repeatable
    vim.keymap.set({ "n", "x", "o" }, "f", repeat_move.builtin_f_expr, { expr = true })
    vim.keymap.set({ "n", "x", "o" }, "F", repeat_move.builtin_F_expr, { expr = true })
    vim.keymap.set({ "n", "x", "o" }, "t", repeat_move.builtin_t_expr, { expr = true })
    vim.keymap.set({ "n", "x", "o" }, "T", repeat_move.builtin_T_expr, { expr = true })
  end,
}
