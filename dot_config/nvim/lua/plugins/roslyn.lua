return {
  ---@module 'roslyn.config'
  ---@type RoslynNvimConfig
  "seblyng/roslyn.nvim",
  ft = "cs",
  opts = {
    -- your configuration comes here; leave empty for default settings
    filewatching = "roslyn",
  },
  config = function(_, opts)
    require("roslyn").setup(opts)

    -- Watch Unity .csproj / .sln file changes and restart roslyn lsp
    local group = vim.api.nvim_create_augroup("RoslynAutoRestart", { clear = true })

    vim.api.nvim_create_autocmd("BufWritePost", {
      pattern = { "*.csproj", "*.sln" },
      callback = function()
        vim.defer_fn(function()
          vim.cmd("Roslyn restart")
          vim.notify("🔄 Roslyn LSP Restarted (主人，已经为您重启了喵~)", vim.log.levels.INFO)
        end, 300)
      end,
      group = group,
    })

    vim.keymap.set("n", "<leader>rr", "<cmd>Roslyn restart<cr>", { desc = "[R]oslyn [r]estart" })
  end,
}
