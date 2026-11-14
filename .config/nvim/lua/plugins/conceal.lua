---@diagnostic disable: missing-parameter
return {
  "Jxstxs/conceal.nvim",
  requires = "nvim-treesitter/nvim-treesitter",
  config = function()
    local conceal = require("conceal")

    conceal.setup({})

    local function toggle_all_conceal()
      conceal.toggle_conceal()
    end

    vim.keymap.set("n", "<leader>tc", toggle_all_conceal, {
      silent = true,
      desc = "[T]oggle [C]onceal",
    })

    vim.api.nvim_create_user_command("Conceal", function(opts)
      if opts.args == "off" then
        conceal.toggle_conceal(0)
      elseif opts.args == "on" then
        conceal.toggle_conceal(2)
      else
        toggle_all_conceal()
      end
    end, { nargs = "?" })
  end,
}
