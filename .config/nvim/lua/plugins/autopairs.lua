-- autopairs
-- https://github.com/windwp/nvim-autopairs

return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  cmd = "Autopairs",
  dependencies = { "hrsh7th/nvim-cmp" }, -- Optional dependency
  config = function()
    local autopairs = require("nvim-autopairs")

    local enabled_by_default = true

    autopairs.setup({})
    if not enabled_by_default then
      autopairs.disable()
    end

    -- Automatically add () after selecting a procedure.
    local cmp = require("cmp")
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local on_confirm = cmp_autopairs.on_confirm_done()

    cmp.event:on("confirm_done", function(event)
      if not autopairs.state.disabled then
        on_confirm(event)
      end
    end)

    -- Toggle on/off

    vim.api.nvim_create_user_command("Autopairs", function(opts)
      if opts.args == "on" then
        autopairs.enable()
      elseif opts.args == "off" then
        autopairs.disable()
      elseif opts.args == "" then
        autopairs.toggle()
      else
        vim.notify("Usage: Autopairs [on|off]", vim.log.levels.ERROR)
        return
      end

      print("Autopairs: " .. (autopairs.state.disabled and "off" or "on"))
    end, {
      nargs = "?",
      complete = function()
        return { "on", "off" }
      end,
    })
  end,
}
