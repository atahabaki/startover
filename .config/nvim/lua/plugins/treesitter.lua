local success, tsconf = pcall(require, "nvim-treesitter.configs")
if not success then
	return
end

tsconf.setup {
	ensure_installed = {"lua", "rust", "json", "toml"},
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = { enable = true, disable = { "yaml" } }
}
