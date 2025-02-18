local function oil_path()
	local path = vim.fn.fnamemodify(require('oil').get_current_dir(), ':~:.')
	if path == '' then
		return './'
	else
		return path
	end
end

local filename = {
	'filename',
	path = 1,
	newfile_status = true,
}

return {
	'nvim-lualine/lualine.nvim',
	event = "VeryLazy",
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	init = function()
		vim.opt.showtabline = 0
	end,
	opts = {
		options = {
			globalstatus = true,
			always_divide_middle = false,
		},
		sections = {
			lualine_a = { 'mode' },
			lualine_b = { 'branch', 'diff' },
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = { 'tabs' },
		},
		winbar = {
			lualine_a = { filename },
			lualine_b = { 'filetype' },
			lualine_c = {},
			lualine_x = { 'searchcount' },
			lualine_y = { 'diagnostics' },
			lualine_z = { 'location', 'progress' },
		},
		inactive_winbar = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { filename },
			lualine_x = { 'searchcount' },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		extensions = {
			{
				winbar = {
					lualine_a = { oil_path },
					lualine_b = { 'filetype' },
					lualine_c = {},
					lualine_x = { 'searchcount' },
					lualine_y = { 'diagnostics' },
					lualine_z = { 'location', 'progress' },
				},
				inactive_winbar = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { oil_path },
					lualine_x = { 'searchcount' },
					lualine_y = {},
					lualine_z = {},
				},
				filetypes = { 'oil' },
			},
		}
	},
}
