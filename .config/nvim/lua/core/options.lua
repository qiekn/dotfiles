-- [[ Setting options ]]
-- See `:help vim.opt` For more options, you can see `:help option-list`
local set = vim.opt

set.number = true
set.relativenumber = true
set.cursorline = true
set.mouse = "a"

-- fold
set.foldmethod = "expr"
set.foldexpr = "nvim_treesitter#foldexpr()"
set.foldenable = false

-- indent
set.tabstop = 2
set.shiftwidth = 2
set.expandtab = true
set.breakindent = true -- Enable break indent

set.list = true
set.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.cmd("autocmd FileType go setlocal nolist")

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  set.clipboard = "unnamedplus"
end)

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

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "o" })
  end,
})

-- Preview substitutions live, as you type!
set.inccommand = "split"

-- Minimal number of screen lines to keep above and below the cursor.
set.scrolloff = 10

-- comment :h gc
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  callback = function()
    vim.opt_local.commentstring = "// %s"
  end,
})

-- Conceal
set.conceallevel = 2
-- set.concealcursor = "nc"

-- File Encoding
set.fileencodings = { "utf-8", "gb2312", "gbk", "gb18030" }
set.fileencoding = "utf-8"
set.encoding = "utf-8"
set.fileformat = "unix"

-- Msys2 shell
set.shellcmdflag = "-c"
set.shellquote = ""
set.shellxquote = ""
set.shellslash = true
