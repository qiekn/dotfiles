---@diagnostic disable: missing-parameter
return {
  "Jxstxs/conceal.nvim",
  requires = "nvim-treesitter/nvim-treesitter",
  config = function()
    local conceal = require("conceal")

    conceal.setup({
      --[[ ["language"] = {
        enabled = bool,
        keywords = {
          ["keyword"] = {
              enabled     = bool,
              conceal     = string,
              highlight   = string
          }
        }
    } ]]
    })

    -- generate the scm queries
    -- only need to be run when the Configuration changes
    conceal.generate_conceals()

    -- bind a <leader>tc to toggle the concealing level
    vim.keymap.set("n", "<leader>tc", function()
      require("conceal").toggle_conceal()
    end, { silent = true, desc = "[T]oggle [C]onceal Level" })

    vim.api.nvim_create_user_command("Conceal", function(opts)
      if opts.args == "off" then
        require("conceal").disable()
      elseif opts.args == "on" then
        require("conceal").enable()
      else
        require("conceal").toggle_conceal()
      end
    end, { nargs = "?" })
  end,
}
