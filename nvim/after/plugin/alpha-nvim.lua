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

alpha.setup(alpha_config)
