vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

require("options")

-- [[ Install `lazy.nvim` plugin manager ]]
require("lazy-bootstrap")

-- [[ Configure and install plugins ]]
require("lazy-plugins")

-- [[ Custom Keymaps ]]
require("keymaps")

-- [[ UI Style ]]
require("scheme")
