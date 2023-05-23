local success, _ = pcall(vim.cmd, "colorscheme catppuccin-mocha")
if not success then
	vim.print("Colorscheme not found.")
	return
end
