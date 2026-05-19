---@diagnostic disable: missing-parameter
return {
  "Jxstxs/conceal.nvim",
  requires = "nvim-treesitter/nvim-treesitter",
  config = function()
    local conceal = require("conceal")

    conceal.setup({})

    --------------------------------------------------------------------------
    -- Lua function virtual "{"
    --------------------------------------------------------------------------

    local lua_brace_enabled = true
    local lua_brace_ns = vim.api.nvim_create_namespace("qiekn_lua_function_brace")

    --stylua: ignore
    local lua_function_query = vim.treesitter.query.parse("lua", [[
      (function_declaration
        parameters: (parameters) @params)

      (function_definition
        parameters: (parameters) @params)
    ]])

    local function clear_lua_function_braces(bufnr)
      bufnr = bufnr or vim.api.nvim_get_current_buf()
      vim.api.nvim_buf_clear_namespace(bufnr, lua_brace_ns, 0, -1)
    end

    local function render_lua_function_braces(bufnr)
      bufnr = bufnr or vim.api.nvim_get_current_buf()

      if not lua_brace_enabled then
        clear_lua_function_braces(bufnr)
        return
      end

      if vim.bo[bufnr].filetype ~= "lua" then
        return
      end

      clear_lua_function_braces(bufnr)

      local ok, parser = pcall(vim.treesitter.get_parser, bufnr, "lua")
      if not ok or not parser then
        return
      end

      local tree = parser:parse()[1]
      if not tree then
        return
      end

      local root = tree:root()

      for _, node in lua_function_query:iter_captures(root, bufnr, 0, -1) do
        local _, _, end_row, end_col = node:range()

        vim.api.nvim_buf_set_extmark(bufnr, lua_brace_ns, end_row, end_col, {
          virt_text = { { " {", "Delimiter" } },
          virt_text_pos = "inline",
          hl_mode = "combine",
          priority = 200,
        })
      end
    end

    vim.api.nvim_create_autocmd({
      "BufEnter",
      "TextChanged",
      "TextChangedI",
      "InsertLeave",
    }, {
      pattern = "*.lua",
      callback = function(args)
        vim.schedule(function()
          if vim.api.nvim_buf_is_valid(args.buf) then
            render_lua_function_braces(args.buf)
          end
        end)
      end,
    })

    --------------------------------------------------------------------------
    -- Toggle conceal + virtual braces together
    --------------------------------------------------------------------------

    local function toggle_all_conceal()
      conceal.toggle_conceal()

      lua_brace_enabled = not lua_brace_enabled

      local bufnr = vim.api.nvim_get_current_buf()
      if lua_brace_enabled then
        render_lua_function_braces(bufnr)
      else
        clear_lua_function_braces(bufnr)
      end
    end

    vim.keymap.set("n", "<leader>tc", toggle_all_conceal, {
      silent = true,
      desc = "[T]oggle [C]onceal",
    })

    vim.api.nvim_create_user_command("Conceal", function(opts)
      if opts.args == "off" then
        conceal.disable()
        lua_brace_enabled = false
        clear_lua_function_braces()
      elseif opts.args == "on" then
        conceal.enable()
        lua_brace_enabled = true
        render_lua_function_braces()
      else
        toggle_all_conceal()
      end
    end, { nargs = "?" })
  end,
}
