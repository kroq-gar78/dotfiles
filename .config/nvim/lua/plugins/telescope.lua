return {
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.5',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope-fzf-native.nvim',
		},
		init = function(_self)
			local wk = require('utils.which-key')
			wk.label_group('<leader>f', 'Telescope')
		end,
		config = function(_self, opts)
			local telescope = require('telescope')
			telescope.setup(opts)
			telescope.load_extension('fzf')
		end,
		opts = {
			pickers = {
				find_files = {
					find_command = {
						"fd",
						"--type", "file",
						"--type", "directory",
						"--color", "never",
					}
				}
			}
		},
		keys = function(_self)
			local builtin = require('telescope.builtin')
			return {
				{ '<leader>ff', builtin.find_files,  desc = "Search file names" },
				{ '<leader>fg', builtin.live_grep,   desc = "Search file contents" },
				{ '<leader>fb', builtin.buffers,     desc = "Search buffers" },
				{ '<leader>fh', builtin.help_tags,   desc = "Search help tags" },
				{ '<leader>fe', builtin.diagnostics, desc = "Search diagnostics" },
			}
		end,
	},
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		lazy = true,
		build = 'make',
	}
}
