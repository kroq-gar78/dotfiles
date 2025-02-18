local M = {}

function M.label_group(prefix, label, opts)
	opts = opts or {}

	local status, wk = pcall(require, 'which-key')
	if status then
		wk.add(
			{
				{
					prefix,
					group = label,
					mode = opts.mode,
					buffer = opts.buffer,
				},
			}
		)
	end
end

return M
