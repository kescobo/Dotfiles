local wezterm = require("wezterm")
local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")
local config = wezterm.config_builder()

smart_splits.apply_to_config(config)

config.color_scheme = "Rosé Pine (Gogh)"
config.font = wezterm.font("Fira Code")
config.font_size = 12

config.default_gui_startup_args = { "connect", "unix" }

config.unix_domains = {
	{
		name = "unix",
	},
}

return config

