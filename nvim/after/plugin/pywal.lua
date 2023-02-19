local pywal = require('pywal')

pywal.setup()
vim.keymap.set('n', '<leader>cs', vim.cmd.colorscheme('pywal'), {})
