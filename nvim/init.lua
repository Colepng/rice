require('plugins')

--vim.g.loaded_netrw = 1
--endvim.g.loaded_netrwPlugin = 1

require("configs/vscode")
require("configs/nvim-tree")
require("configs/cmp")
require("configs/nvim-comment")

-- commands
vim.api.nvim_command("set number")
vim.api.nvim_command("NvimTreeOpen")
