return {
	{
		"huggingface/llm.nvim",
		opts = {
			backend = "openai",
			url = "http://localhost:8000/v1/completions",
			model = "codeqwen",
			request_body = {},
			tokens_to_clear = { "<|endoftext|>" },
			fim = {
				enabled = true,
				prefix = "<fim_prefix>",
				middle = "<fim_middle>",
				suffix = "<fim_suffix>",
			},
			context_window = 16000,
			--url = "http://localhost:11434/api/generate",
		},
	},
}
