vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("lualine").setup({

	-- disable netrw at the very start of your init.lua (strongly advised)
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "|", right = "|" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})

require("material").setup({
	lualine_style = "stealth",
})

require("bufferline").setup({
	options = {
		separator_style = "thin",
		-- offsets = {
		--     {
		--         filetype = "NvimTree",
		--         text = "Explorer",
		--         highlight = "Directory",
		--         separator = true -- use a "true" to enable the default, or set your own character
		--     }
		-- },
		-- enforce_regular_tabs = false,
		-- truncate_names = false
	},
	highlights = {
		buffer_selected = {
			italic = false,
		},
	},
})

-- require('onedark').setup {
--     style = 'darker'
-- }
-- require('onedark').load()

require("catppuccin").setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
})

--LSP Setup
--Set up lspconfig
-- used to enable autocompletion (assign to every lsp server config)
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
	-- keybind options
	local opts = { noremap = true, silent = true, buffer = bufnr }
	local keymap = vim.keymap

	-- set keybinds
	keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
	keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	keymap.set("n", "K", vim.lsp.buf.hover, opts)
	keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
	keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
	keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
	keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, opts)
	keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
	keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
	keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
	keymap.set("n", "gr", vim.lsp.buf.references, opts)
	keymap.set("n", "<space>f", function()
		vim.lsp.buf.format({ async = true })
	end, opts)

	-- typescript specific keymaps (e.g. rename file and update imports)
	if client.name == "tsserver" then
		keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
		keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
		keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
	end
end

-- Change the Diagnostic symbols in the sign column (gutter)
-- (not in youtube nvim video)
local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

require("lspconfig")["pyright"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	flags = lsp_flags,
})

require("lspconfig")["intelephense"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	flags = lsp_flags,
})

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

-- disable virtual_text (inline) diagnostics and use floating window
-- format the message such that it shows source, message and
-- the error code. Show the message with <space>e
vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	float = {
		border = "single",
		format = function(diagnostic)
			return string.format(
				"%s (%s) [%s]",
				diagnostic.message,
				diagnostic.source,
				diagnostic.code or diagnostic.user_data.lsp.code
			)
		end,
	},
})

-- Set up nvim-cmp.
local cmp = require("cmp")
local lspkind = require("lspkind")
cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "vsnip" }, -- For vsnip users.
		-- { name = 'luasnip' }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
	}, {
		{ name = "buffer" },
	}),
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol", -- show only symbol annotations
			maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
			ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
		}),
	},
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = "buffer" },
	}),
})

require("Comment").setup()

require("mason").setup()

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

require("nvim-tree").setup({
	-- change folder arrow icons
	renderer = {
		icons = {
			glyphs = {
				folder = {
					arrow_closed = "〉", -- arrow when folder is closed
					arrow_open = "﹀", -- arrow when folder is open
				},
			},
		},
	},
	-- disable window_picker for
	-- explorer to work well with
	-- window splits
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
	view = {
		width = 35,
	},
	sync_root_with_cwd = true,
})

local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({

	sources = {
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.isort,
		null_ls.builtins.diagnostics.flake8,
		null_ls.builtins.diagnostics.mypy,
		null_ls.builtins.formatting.phpcbf,
		null_ls.builtins.formatting.stylua,
	},
	-- configure format on save
	on_attach = function(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							--  only use null-ls for formatting instead of lsp server
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end,
			})
		end
	end,
})

require("nvim-treesitter.configs").setup({
	-- enable syntax highlighting
	highlight = {
		enable = true,
	},
	-- enable indentation
	indent = { enable = true },
	-- enable autotagging (w/   }nvim-ts-autotag plugin)
	autotag = { enable = true },
	-- ensure these language parsers are installed
	ensure_installed = {
		"python",
		"json",
		"javascript",
		"typescript",
		"tsx",
		"yaml",
		"html",
		"css",
		"markdown",
		"svelte",
		"graphql",
		"bash",
		"lua",
		"vim",
		"dockerfile",
		"gitignore",
	},
	-- auto install above language parsers
	auto_install = true,
})

local alpha = require("alpha")
local alpha_theme = require("alpha.themes.theta")
require("alpha.term")

local alpha_header = {
	type = "terminal",
	command = "cat | ascii-image-converter --color " .. os.getenv("HOME") .. "/Code/neovim_logo_cropped.png -W 40",
	width = 40,
	height = 24,
	opts = {
		position = "center",
		redraw = true,
		window_config = {},
	},
}

alpha_config = alpha_theme.config
alpha_config.layout[2] = alpha_header
alpha_config.layout[3] = {
	type = "text",
	val = {
		[[]],
		[[]],
		[[]],
		[[                                             o8o]],
		[[                                             `"']],
		[[ooo. .oo.    .ooooo.   .ooooo.  oooo    ooo oooo  ooo. .oo.  .oo.]],
		[[`888P"Y88b  d88' `88b d88' `88b  `88.  .8'  `888  `888P"Y88bP"Y88b]],
		[[ 888   888  888ooo888 888   888   `88..8'    888   888   888   888]],
		[[ 888   888  888    .o 888   888    `888'     888   888   888   888]],
		[[o888o o888o `Y8bod8P' `Y8bod8P'     `8'     o888o o888o o888o o888o]],
		[[]],
		[[]],
		[[]],
		[[]],
	},
	opts = {
		hl = "SpecialComment",
		position = "center",
	},
}
alpha_config.layout[6] = { type = "padding", val = 2 }

-- alpha.setup(new_alpha_config)
alpha.setup(alpha_config)

vim.notify = require("notify")
vim.opt.clipboard:append("unnamedplus")
vim.cmd("colorscheme onedarker")
