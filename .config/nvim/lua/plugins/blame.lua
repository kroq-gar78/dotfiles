return {
	{
		'FabijanZulj/blame.nvim',
		main = 'blame',
		config = function()
			require('blame').setup {}
		end,
	},
}
