local success, npairs = pcall(require, "nvim-autopairs")
if not success then
	return
end

npairs.setup {
	check_ts = true,
	disable_filetype = { "TelescopePrompt", "spectre_panel" },
	fast_wrap = {
		map = '<M-e>',
		chars = { '{', '[', '(', '"', "'" },
		pattern = [=[[%'%"%>%]%)%}%,]]=],
		end_key = '$',
		keys = 'qwertyuiopzxcvbnmasdfghjkl',
		check_comma = true,
		manual_position = true,
		highlight = 'Search',
		highlight_grey = 'Comment'
	},
}

local cmp_autopairs = require "nvim-autopairs.completion.cmp"
local s_cmp, cmp = pcall(require, "cmp")
if not s_cmp then
	return
end

cmp.event:on(
	'confirm_done',
	cmp_autopairs.on_confirm_done()
)
