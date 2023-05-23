local s_lspconfig, lspconfig = pcall(require, "lspconfig")
if not s_lspconfig then
	return
end

local s_cmplsp, cmplsp = pcall(require, "cmp_nvim_lsp")
if not s_cmplsp then
	return
end

local signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

vim.diagnostic.config({
	signs = { active = signs },
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "rounded",
})

-- c: client, b: buffer
local on_attach = function(c, b)
	-- options
	local o = {noremap = true, silent = true}
	-- highlight document
	if c.server_capabilities.documentHighlight then
		vim.api.nvim_exec(
			[[
			augroup lsp_document_highlight
			autocmd! * <buffer>
			autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
			autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
			augroup END
			]],
		false)
	end
	-- keymaps
	vim.api.nvim_buf_set_keymap(b, "n", "gD", ":lua vim.lsp.buf.declaration()<CR>", o)
	vim.api.nvim_buf_set_keymap(b, "n", "gd", ":lua vim.lsp.buf.definition()<CR>", o)
	vim.api.nvim_buf_set_keymap(b, "n", "gi", ":lua vim.lsp.buf.implementation()<CR>", o)
	vim.api.nvim_buf_set_keymap(b, "n", "gr", ":lua vim.lsp.buf.references()<CR>", o)
	vim.api.nvim_buf_set_keymap(b, "n", "K", ":lua vim.lsp.buf.hover()<CR>", o)
	vim.api.nvim_buf_set_keymap(b, "n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", o)
	vim.api.nvim_buf_set_keymap(b, "n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", o)
	vim.api.nvim_buf_set_keymap(b, "n", "[d", ':lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', o)
	vim.api.nvim_buf_set_keymap(b, "n", "]d", ':lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', o)
	vim.api.nvim_buf_set_keymap(b, "n", "gl", ':lua vim.diagnostic.open_float()<CR>', o)
	vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format()' ]]
end

local capabilities = cmplsp.default_capabilities()

lspconfig["lua_ls"].setup {
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT',
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = {'vim'},
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				}
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		}
	}
}

lspconfig["jsonls"].setup {
	capabilities = capabilities,
	on_attach = on_attach
}

lspconfig["taplo"].setup {
	capabilities = capabilities,
	on_attach = on_attach
}

lspconfig["rust_analyzer"].setup {
	capabilities = capabilities,
	on_attach = on_attach
}
