return {
	{
		'stevearc/oil.nvim',
		lazy = false,
		opts = {
			skip_confirm_for_simple_edits = true,
		},
		dependencies = {
			'nvim-tree/nvim-web-devicons'
		},
		keys = {
			{ '-', vim.cmd.Oil, desc = "Open Oil" },
		},
	}
}
