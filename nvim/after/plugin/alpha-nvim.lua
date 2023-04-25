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

local alpha_header_img = {
	type = "terminal",
	command = "cat | chafa ~/Code/neovim_stack.png --size 50x40",
	width = 50,
	height = 40,
	opts = {
		position = "center",
		redraw = true,
		window_config = {},
	},
}

alpha_config = alpha_theme.config
alpha_config.layout[2] = alpha_header_img
alpha_config.layout[3] = {
	type = "text",
	val = {
		[[]],
		[[]],
		[[]],
		[[]],
		[[]],
		[[]],
		[[]],
	},
}
alpha_config.layout[6] = { type = "padding", val = 2 }

alpha.setup(alpha_config)
