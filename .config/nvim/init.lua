vim.opt.modeline = false

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'number'
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.confirm = true
vim.opt.wrap = false

vim.opt.foldmethod = 'syntax'
vim.opt.foldlevelstart = 99
vim.opt.foldcolumn = '1'
vim.opt.foldignore = ''
vim.opt.sidescrolloff = 1
vim.opt.conceallevel = 2

vim.opt.listchars = {
	tab = '│ ',
	eol = '↲',
	precedes = '◄',
	extends = '►',
	nbsp = '⎵',
	trail = '·',
}
vim.opt.list = true
vim.opt.fillchars = {
	eob = ' ',
	lastline = '.',
}
vim.opt.display = {
	'lastline',
	'uhex',
}

vim.opt.expandtab = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 0
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.title = true
vim.opt.titlestring = '%{substitute(getcwd(), "^" . $HOME, "~", 0)} - NVIM'

vim.opt.updatetime = 1000
vim.g.mapleader = ' '
vim.keymap.set('n', '<space>', '<nop>')

vim.keymap.set(
	'n',
	'<c-->',
	vim.cmd.terminal,
	{
		silent = true,
		desc = "Open terminal",
	}
)
vim.keymap.set(
	'n',
	'<c-/>',
	vim.cmd.nohlsearch,
	{
		silent = true,
		desc = "Clear search highlights",
	}
)

vim.g.python_indent = {
	open_paren = 'shiftwidth()',
	continue = 'shiftwidth()',
	closed_paren_align_last_line = false,
}

local augroup = vim.api.nvim_create_augroup('init', { clear = true })
vim.api.nvim_create_autocmd('VimResized', {
	group = augroup,
	callback = function(_ev)
		if vim.o.equalalways then
			vim.cmd.wincmd("=")
		end
	end
})

require('editorconfig').properties.filetype = function(bufnr, val, opts)
	vim.bo[bufnr].filetype = val
end

require('config.lazy')

vim.opt.background = 'dark'
vim.cmd.colorscheme("catppuccin")
