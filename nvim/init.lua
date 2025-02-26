vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = false

require("options")
require("keymaps")

-- [[ Install `lazy.nvim` plugin manager ]]
require("lazy-bootstrap")

-- [[ Configure and install plugins ]]
require("lazy-plugins")
