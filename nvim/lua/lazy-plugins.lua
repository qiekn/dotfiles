-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
-- To update plugins you can run
--    :Lazy update

-- NOTE: Here is where you install your plugins.
require("lazy").setup({
  -- Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically

  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  -- Use `opts = {}` to automatically pass options to a plugin's `setup()` function, forcing the plugin to be loaded.

  -- modular approach: using `require 'path/name'` will include a plugin definition from file lua/path/name.lua

  require("plugins/gitsigns"),

  require("plugins/which-key"),

  require("plugins/telescope"),

  require("plugins/lspconfig"),

  -- require("plugins/conform"), --formart

  require("plugins/cmp"),

  require("plugins/colorscheme"),

  require("plugins/todo-comments"),

  require("plugins/mini"),

  require("plugins/treesitter"),

  require("plugins/indent_line"),

  require("plugins/autopairs"),

  require("plugins/neo-tree"),

  -- require 'plugins/debug',
  -- require("plugins/lint"),

  { import = "custom.plugins" },
})
