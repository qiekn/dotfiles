return {
  { "nvim-treesitter/nvim-treesitter-context" },

  -- Tree-sitter migration guide for Neovim 0.12
  -- https://www.qu8n.com/posts/treesitter-migration-guide-for-nvim-0-12
  { -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    main = "nvim-treesitter", -- Sets main module to use for opts
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    opts = {
      -- Autoinstall languages that are not installed
      auto_install = true,
    },
    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  },
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        -- Enable treesitter highlighting and disable regex syntax
        pcall(vim.treesitter.start)
        -- Enable treesitter-based indentation
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
    local ensure_installed = {
      "bash",
      "c",
      "cpp",
      "diff",
      "html",
      "css",
      "javascript",
      "typescript",
      "tsx",
      "json",
      "lua",
      "luadoc",
      "markdown",
      "markdown_inline",
      "query",
      "vim",
      "vimdoc",
    }
    local already_installed = require("nvim-treesitter.config").get_installed()
    local parsers_to_install = vim
      .iter(ensure_installed)
      :filter(function(parser)
        return not vim.tbl_contains(already_installed, parser)
      end)
      :totable()
    require("nvim-treesitter").install(parsers_to_install)
  end,
}
-- vim: ts=2 sts=2 sw=2 et
