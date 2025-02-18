return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })()
		end,
		dependencies = {
			"windwp/nvim-ts-autotag",
		},
		config = function(self, opts)
			local configs = require("nvim-treesitter.configs")
			configs.setup(opts)

			vim.opt.foldmethod = "expr"
			vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
		end,
		opts = {
			ensure_installed = {
				"lua",
				"python",
			},
			highlight = {
				enable = true,
				disable = {
					"markdown",
					"markdown_inline",
				},
			},
			autotag = {
				enable = true,
			},
		},
	},
}
