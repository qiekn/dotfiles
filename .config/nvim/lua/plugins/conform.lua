return {
  { -- Autoformat
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>f",
        function()
          require("conform").format({ async = true, lsp_format = "fallback" })
        end,
        mode = "",
        desc = "[F]ormat buffer",
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- debug
        print("Filetype: " .. vim.bo[bufnr].filetype)

        -- Disable format third part library code if filepath contains 'deps' or 'vendors'
        local filepath = vim.api.nvim_buf_get_name(bufnr)
        local is_3rdparty = filepath:find("deps[/\\]") or filepath:find("vendors[/\\]")
        if is_3rdparty then
          return nil
        end

        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = {
          c = true,
          json = true,
          cpp = true,
        }
        if disable_filetypes[vim.bo[bufnr].filetype] then
          return nil
        else
          return {
            timeout_ms = 500,
            lsp_format = "fallback",
          }
        end
      end,
      formatters_by_ft = {
        lua = { "stylua" },
        go = { "gofmt", "goimports" },
        cpp = { "clang-format" },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use 'stop_after_first' to run the first available formatter from the list
        html = { "prettier" },
        scss = { "prettier" },
        css = { "prettier" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        tex = { "tex-fmt" },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
