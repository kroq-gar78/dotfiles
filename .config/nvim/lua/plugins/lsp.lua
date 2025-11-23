return {
	{
		'neovim/nvim-lspconfig',
		lazy = false,
		config = function()
			vim.lsp.enable {
				"pyright",
			}

			vim.api.nvim_create_autocmd('LspAttach', {
				group = vim.api.nvim_create_augroup('lsp', {}),
				callback = function(ev)
					local client = vim.lsp.get_client_by_id(ev.data.client_id)
					if not client then
						return
					end

					vim.keymap.set(
						'n',
						'gD',
						vim.lsp.buf.declaration,
						{ buffer = ev.buf, desc = "Go to declaration" }
					)
					vim.keymap.set(
						'n',
						'gd',
						vim.lsp.buf.definition,
						{ buffer = ev.buf, desc = "Go to definition" }
					)
					vim.keymap.set(
						'n',
						'gi',
						vim.lsp.buf.implementation,
						{ buffer = ev.buf, desc = "Go to implementation" }
					)
					vim.keymap.set(
						'n',
						'gr',
						vim.lsp.buf.references,
						{ buffer = ev.buf, desc = "Go to a reference" }
					)
					vim.keymap.set(
						'n',
						'gs',
						vim.lsp.buf.type_definition,
						{ buffer = ev.buf, desc = "Go to type definition" }
					)

					vim.keymap.set(
						{ 'n', 'i' },
						'<cs-k>',
						vim.lsp.buf.signature_help,
						{ buffer = ev.buf, desc = "Open signature help" }
					)

					--[[local wk = require('utils.which-key')
					wk.label_group('<leader>c', 'LSP actions', { buffer = ev.buf })]]

					vim.keymap.set(
						'n',
						'<leader>cn',
						vim.lsp.buf.rename,
						{ buffer = ev.buf, desc = "Rename symbol" }
					)
					vim.keymap.set(
						'n',
						'<leader>cf',
						function()
							vim.lsp.buf.format { async = true }
						end,
						{ buffer = ev.buf, desc = "Format buffer" }
					)
					vim.keymap.set(
						{ 'n', 'v' },
						'<leader>ca',
						vim.lsp.buf.code_action,
						{ buffer = ev.buf, desc = "Run code action" }
					)

					--[[if client.supports_method("textDocument/formatting") then
						local augroup = vim.api.nvim_create_augroup('lsp-attach', { clear = false })
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = ev.buf })

						vim.api.nvim_create_autocmd('BufWritePre', {
							group = augroup,
							buffer = ev.buf,
							callback = function()
								vim.lsp.buf.format({ async = false })
							end,
						})
					end]]
				end,
			})
		end,
		keys = {
		},
	}
}
