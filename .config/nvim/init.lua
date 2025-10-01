vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

require("core.options")

-- [[ Install `lazy.nvim` plugin manager ]]
require("core.lazy-bootstrap")

-- [[ Configure and install plugins ]]
require("core.lazy-plugins")

-- [[ Custom Keymaps ]]
require("core.keymaps")

-- [[ UI Style ]]
require("core.scheme")

-- [[ How to quit Vim ]]
require("core.commands")
