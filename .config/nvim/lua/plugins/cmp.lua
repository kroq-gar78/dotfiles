return {
	{
		'hrsh7th/nvim-cmp',
		main = 'cmp',
		dependencies = {
			'hrsh7th/cmp-nvim-lsp',
			'saadparwaiz1/cmp_luasnip',
		},
		opts = function(self, opts)
			local cmp = require(self.main)
			opts.snippet = {
				expand = function(args)
					require('luasnip').lsp_expand(args.body)
				end,
			}
			opts.sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'luasnip' },
			})
			opts.mapping = cmp.mapping.preset.insert({
				['<c-y>'] = cmp.mapping.confirm({ select = true }),
			})
		end,
	},
}
