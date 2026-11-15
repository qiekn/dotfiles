return {
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      { "kevinhwang91/promise-async" },
      {
        "luukvbaal/statuscol.nvim",
        config = function()
          local builtin = require("statuscol.builtin")
          require("statuscol").setup({
            relculright = true,
            segments = {
              -- { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
              { text = { "%s" }, click = "v:lua.ScSa" },
              { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
            },
          })
        end,
      },
    },
    event = "BufReadPost",
    opts = {
      provider_selector = function(bufnr, filetype)
        -- fold for ultisnips files
        if filetype == "snippets" then
          return function()
            local folds = {}
            local start

            for i, line in ipairs(vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)) do
              if line:match("^snippet ") then
                start = i - 1
              elseif line:match("^endsnippet") and start then
                folds[#folds + 1] = {
                  startLine = start,
                  endLine = i - 1,
                }
                start = nil
              end
            end

            return folds
          end
        end

        -- There is no treesitter for jai, include } to make fold single line
        if filetype == "jai" then
          return function()
            local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
            local folds = {}
            local stack = {}
            for lnum, raw in ipairs(lines) do
              local line = raw:gsub("//.*$", ""):gsub('"[^"\\]*"', "")
              for i = 1, #line do
                local c = line:sub(i, i)
                if c == "{" then
                  table.insert(stack, lnum - 1)
                elseif c == "}" then
                  local s = table.remove(stack)
                  if s and (lnum - 1) > s then
                    table.insert(folds, { startLine = s, endLine = lnum - 1 })
                  end
                end
              end
            end
            return folds
          end
        end

        return { "treesitter", "indent" }
      end,
      fold_virt_text_handler = function(virt_text, lnum, end_lnum, width, truncate)
        local new_virt_text = {}
        local folded_lines = end_lnum - lnum + 1

        -- local suffix = " ⋯ (" .. folded_lines .. " 行被折叠了喵~)"
        local suffix = " ⋯ " .. folded_lines .. " lines"
        local suffix_width = vim.fn.strdisplaywidth(suffix)
        local target_width = width - suffix_width
        local current_width = 0

        -- Preserve the first line's content and truncate it if necessary.
        for _, chunk in ipairs(virt_text) do
          local chunk_text = chunk[1]
          local chunk_width = vim.fn.strdisplaywidth(chunk_text)

          if target_width > current_width + chunk_width then
            table.insert(new_virt_text, chunk)
            current_width = current_width + chunk_width
          else
            chunk_text = truncate(chunk_text, target_width - current_width)
            table.insert(new_virt_text, { chunk_text, chunk[2] })
            current_width = current_width + vim.fn.strdisplaywidth(chunk_text)
            break
          end
        end

        table.insert(new_virt_text, { suffix, "Folded" })
        return new_virt_text
      end,
    },
    init = function()
      vim.o.foldcolumn = "0"
      vim.o.signcolumn = "auto"
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
      vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

      vim.keymap.set("n", "zR", function()
        require("ufo").openAllFolds()
      end)
      vim.keymap.set("n", "zM", function()
        require("ufo").closeAllFolds()
      end)
    end,
  },
  -- Folding preview, by default h and l keys are used.
  -- On first press of h key, when cursor is on a closed fold, the preview will be shown.
  -- On second press the preview will be closed and fold will be opened.
  -- When preview is opened, the l key will close it and open fold. In all other cases these keys will work as usual.
  -- { "anuvyklack/fold-preview.nvim", dependencies = "anuvyklack/keymap-amend.nvim", config = true },
}
