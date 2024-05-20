return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = {
				"cpp",
				"lua",
				"vim",
				"vimdoc",
				"html",
				"css",
				"javascript",
				"typescript",
				"tsx",
				"python",
				"json",
				"gitignore",
				"bash",
				"yaml",
			},
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
