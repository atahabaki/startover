local s_mason, mason = pcall(require, "mason")
if not s_mason then
	return
end

local s_mason_lspconfig, mason_lspconfig = pcall(require, "mason-lspconfig")
if not s_mason_lspconfig then
	return
end

mason.setup()
mason_lspconfig.setup {
	ensure_installed = { "lua_ls", "rust_analyzer", "taplo", "jsonls" },
}
