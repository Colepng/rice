function ColourMyPenciles(colour)
    colour = colour -- or "vscode"
	vim.cmd.colorscheme(colour)
    vim.keymap.set('n', '<leader>cs', vim.cmd.colorscheme("pywal"), {})
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColourMyPenciles(pywal)
