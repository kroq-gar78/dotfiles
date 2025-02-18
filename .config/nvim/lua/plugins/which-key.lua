return {
	{
		"folke/which-key.nvim",
		dependencies = {
			"echasnovski/mini.icons",
			"nvim-tree/nvim-web-devicons",
		},
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			win = {
				border = "single",
			},
		}
	}
}
