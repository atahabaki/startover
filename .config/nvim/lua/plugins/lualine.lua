-- vim:fileencoding=utf-8:foldmethod=marker
local success, lualine = pcall(require, "lualine")
if not success then
	return
end

lualine.setup {
	options = {
		component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
	},
	sections = {
		lualine_x = {
			'encoding',
			'fileformat',
			'filetype',
			'lsp_progress'
		},
	}
}
