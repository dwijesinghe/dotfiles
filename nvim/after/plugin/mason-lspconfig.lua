require("mason-lspconfig").setup({
	-- list of servers for mason to install
	ensure_installed = {
		"pyright",
		"intelephense",
		"tsserver",
		"html",
		"cssls",
		"tailwindcss",
		"emmet_ls",
	},
	-- auto-install configured servers (with lspconfig)
	automatic_installation = true, -- not the same as ensure_installed
})
