-- [[ Setting options ]]
-- See `:help vim.opt` For more options, you can see `:help option-list`
local set = vim.opt

set.number = true
set.relativenumber = true
set.mouse = "a"

-- fold
set.foldmethod = "expr"
set.foldexpr = "nvim_treesitter#foldexpr()"
set.foldenable = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)

-- Enable break indent
set.breakindent = true

-- Save undo history
set.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
set.ignorecase = true
set.smartcase = true

-- Keep signcolumn on by default
set.signcolumn = "yes"

-- Decrease update time
set.updatetime = 250

-- Decrease mapped sequence wait time
set.timeoutlen = 300

-- Configure how new splits should be opened
set.splitright = true
set.splitbelow = true

set.tabstop = 2
set.shiftwidth = 2
set.expandtab = true
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "o" })
  end,
})

set.list = true
set.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.cmd("autocmd FileType go setlocal nolist")

-- Preview substitutions live, as you type!
set.inccommand = "split"

set.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
set.scrolloff = 10
