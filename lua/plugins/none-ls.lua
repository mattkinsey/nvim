return {
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
	},
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					-- lua support
					null_ls.builtins.formatting.stylua,
					-- python support
					null_ls.builtins.diagnostics.mypy,
					--null_ls.builtins.diagnostics.ruff,
					null_ls.builtins.formatting.black.with({ extra_args = { "--line-length", "120" } }),
					null_ls.builtins.formatting.isort.with({ extra_args = { "--profile", "black" } }),
				},
				on_attach = function(client, bufnr)
					-- auto format on save file
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({
							group = augroup,
							buffer = bufnr,
						})
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({ bufnr = bufnr })
							end,
						})
					end
				end,
			})

			-- manual format
			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
		end,
	},
}
