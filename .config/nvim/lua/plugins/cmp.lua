-- vim:fileencoding=utf-8:foldmethod=marker
local s_cmp, cmp = pcall(require, "cmp")
if not s_cmp then
	return
end

local s_snip, snip = pcall(require, "luasnip")
if not s_snip then
	return
end

local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

--: Icons {{{
local kind_icons = {
	Text = "󰉿 ",
	Method = "󰆧 ",
	Function = "󰊕",
	Constructor = " ",
	Field = "󰜢 ",
	Variable = "󰀫",
	Class = "󰠱 ",
	Interface = " ",
	Module = " ",
	Property = "󰜢 ",
	Unit = "󰑭 ",
	Value = "󰎠 ",
	Enum = " ",
	Keyword = "󰌋 ",
	Snippet = " ",
	Color = "󰏘 ",
	File = "󰈙 ",
	Reference = "󰈇 ",
	Folder = "󰉋 ",
	EnumMember = " ",
	Constant = "󰏿 ",
	Struct = "󰙅 ",
	Event = "",
	Operator = "󰆕 ",
	TypeParameter = "󱌢 ",
}
--: }}}

require("luasnip/loaders/from_vscode").lazy_load()

cmp.setup {
	snippet = {
		expand = function(args)
			snip.lsp_expand(args.body)
		end
	},
	--: Keymaps {{{
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
		['<C-n>'] = cmp.mapping({
			i = function(fallback)
				if cmp.visible() then
					cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
				else
					fallback()
				end
			end
		}),
		['<C-p>'] = cmp.mapping({
			i = function(fallback)
				if cmp.visible() then
					cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
				else
					fallback()
				end
			end
		}),
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif snip.expand_or_locally_jumpable() then
				snip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	--: }}}
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, item)
			-- Kind icons
			item.kind = string.format("%s", kind_icons[item.kind])
			item.menu = ({
				nvim_lsp = "󰿘 LSP",
				nvim_lua = "󰿘 LSP",
				luasnip = " Snippet",
				buffer = " Buffer",
				path = " Path",
			})[entry.source.name]
			return item
		end,
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'nvim_lua' },
		{ name = 'luasnip' },
		{ name = 'buffer' },
		{ name = 'path' },
	},
	confirmation = { completeopt = 'menu,menuone,noinsert' },
	experimental = {
		ghost_text = true
	}
}
