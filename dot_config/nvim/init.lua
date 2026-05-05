require("core.globals")
require("core.options")
require("core.lsp")

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
