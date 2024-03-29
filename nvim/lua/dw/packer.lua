-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd("packer.nvim")

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({
		"rose-pine/neovim",
		as = "rose-pine",
		config = function() end,
	})

	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

	use("mbbill/undotree")

	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ -- Optional
				"williamboman/mason.nvim",
				run = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
		},
	})

	use({ "akinsho/bufferline.nvim", tag = "*", requires = "nvim-tree/nvim-web-devicons" })

	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional
		},
		config = function()
			require("nvim-tree").setup({})
		end,
	})

	use("lunarvim/Onedarker.nvim")

	use({
		"goolord/alpha-nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
	})

	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	use("christoomey/vim-tmux-navigator")

	use("rcarriga/nvim-notify")

	use("johmsalas/text-case.nvim")

	use("lukas-reineke/lsp-format.nvim")

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})

	use("jose-elias-alvarez/null-ls.nvim")

	use("jay-babu/mason-null-ls.nvim")

	use("rakr/vim-one")

	use({
		"glepnir/zephyr-nvim",
		requires = { "nvim-treesitter/nvim-treesitter", opt = true },
	})

	use("tjdevries/colorbuddy.nvim")

	use("tjdevries/gruvbuddy.nvim")

	use("rktjmp/lush.nvim")

	use("WhoIsSethDaniel/toggle-lsp-diagnostics.nvim")

	use("rebelot/kanagawa.nvim")

	use({ "decaycs/decay.nvim", as = "decay" })

	use({ "briones-gabriel/darcula-solid.nvim", requires = "rktjmp/lush.nvim" })

	use("ray-x/starry.nvim")

	use({
		"JellyApple102/easyread.nvim",
	})
end)
