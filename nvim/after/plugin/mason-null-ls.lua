require("mason-null-ls").setup({
	ensure_installed = {
		"black",
		"flake8",
		"isort",
		"mypy",
		"phpcbf",
		"stylua",
	},
})
