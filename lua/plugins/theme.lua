return {
	{
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup()
		end,
	},
	{
		"stevearc/dressing.nvim",
		opts = {},
	},
	{
		"echasnovski/mini.bufremove",
		version = "*",
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			local bufferline = require("bufferline")

			bufferline.setup({
				options = {
					separator_style = "slant",
					close_command = "bdelete! %d",
					-- close_command = function(bufnum)
					--   require("mini.bufremove").delete(bufnum, true)
					-- end,
					diagnostics = "nvim_lsp",
					always_show_bufferline = true,
					offsets = {
						{
							filetype = "neo-tree",
							text = "Neo-tree",
							highlight = "Directory",
							text_align = "left",
						},
					},
				},
			})

			--vim.keymap.set("n", "<leader>x", ":bdelete!<CR>", {})
			--vim.keymap.set("n", "<tab>", ":BufferLineCyclePrev<CR>", {})
			--vim.keymap.set("n", "<S-tab>", ":BufferLineCycleNext<CR>", {})
		end,
		opts = {},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
		config = function()
			require("ibl").setup({
				indent = {
					char = "│",
					tab_char = "│",
				},
				whitespace = {
					remove_blankline_trail = false,
				},
				scope = { enabled = false },
				exclude = {
					filetypes = {
						"help",
						"alpha",
						"dashboard",
						"neo-tree",
						--"Trouble",
						--"trouble",
						"lazy",
						"mason",
						"notify",
						"toggleterm",
						"lazyterm",
					},
				},
			})
		end,
	},
	{
		"echasnovski/mini.indentscope",
		version = "*",
		opts = {
			symbol = "│",
			options = { try_as_border = true },
		},
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				},
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
		config = function()
			require("mini.indentscope").setup()
		end,
	},
	--{
	--	"folke/noice.nvim",
	--	event = "VeryLazy",
	--	opts = {},
	--	dependencies = {
	--		"MunifTanjim/nui.nvim",
	--		"rcarriga/nvim-notify",
	--	},
	--},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {},
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			local bg = "#011628"
			local bg_dark = "#011423"
			local bg_highlight = "#143652"
			local bg_search = "#0A64AC"
			local bg_visual = "#275378"
			local fg = "#CBE0F0"
			local fg_dark = "#B4D0E9"
			local fg_gutter = "#627E97"
			local border = "#547998"
			require("tokyonight").setup({
				style = "night",
				styles = {
					comments = { italic = false },
					keywords = { italic = false },
				},
				--on_colors = function(colors)
				--colors.black = "#000000"
				--colors.bg = colors.black
				--colors.bg_sidebar = colors.black
				--end
				require("tokyonight").setup({
					style = "night",
					on_colors = function(colors)
						colors.bg = bg
						colors.bg_dark = bg_dark
						colors.bg_float = bg_dark
						colors.bg_highlight = bg_highlight
						colors.bg_popup = bg_dark
						colors.bg_search = bg_search
						colors.bg_sidebar = bg_dark
						colors.bg_statusline = bg_dark
						colors.bg_visual = bg_visual
						colors.border = border
						colors.fg = fg
						colors.fg_dark = fg_dark
						colors.fg_float = fg
						colors.fg_gutter = fg_gutter
						colors.fg_sidebar = fg_dark
					end,
				}),
			})
			-- load the colorscheme here
			vim.cmd([[colorscheme tokyonight-night]])
		end,
	},
}
