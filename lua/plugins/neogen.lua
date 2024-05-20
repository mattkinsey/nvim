return {
	{
		"danymat/neogen",
		version = "*",
		config = function()
			require("neogen").setup({
				enabled = true,
				input_after_comment = true,
				languages = {
					python = {
						template = {
							annotation_convention = "numpydoc",
						},
					},
				},
			})
			--local neogen = require("neogen")
			--vim.keymap.set("n", "<leader>nn", neogen.generate, { noremap = true, silent = true })
			--vim.keymap.set("n", "<leader>nf", neogen.generate, { noremap = true, silent = true, type = "func" })
			--vim.keymap.set("n", "<leader>nc", neogen.generate, { noremap = true, silent = true, type = "class" })
			local opts = { noremap = true, silent = true }
			vim.api.nvim_set_keymap("n", "<Leader>nn", ":lua require('neogen').generate()<CR>", opts)
			vim.api.nvim_set_keymap("n", "<Leader>nf", ":lua require('neogen').generate({ type = 'func' })<CR>", opts)
			vim.api.nvim_set_keymap("n", "<Leader>nc", ":lua require('neogen').generate({ type = 'class' })<CR>", opts)
		end,
	},
}
