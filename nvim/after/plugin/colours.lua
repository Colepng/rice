function ColourMyPenciles(colour)
    -- colour = colour or "vscode"
	vim.cmd.colorscheme("vscode")
    -- vim.keymap.set('n', '<leader>cs', vim.cmd.colorscheme("pywal"), {})
	-- vim.api.nvim_set_hl(0, "Normal", { bg = "#181921" })
	-- vim.api.nvim_set_hl(1, "NormalFloat", { bg = "#181921" })
end

ColourMyPenciles(pywal)
