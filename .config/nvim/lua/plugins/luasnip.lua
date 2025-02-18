return {
	{
		'L3MON4D3/LuaSnip',
		build = "make install_jsregexp",
		lazy = false,
		config = function()
			require("luasnip.loaders.from_snipmate").lazy_load()
		end,
		keys = {
			{
				"<c-j>",
				function()
					require("luasnip").jump(1)
				end,
				mode = { "i", "s" },
				desc = "Jump to next snippet placeholder",
			},
			{
				"<c-k>",
				function()
					require("luasnip").jump(-1)
				end,
				mode = { "i", "s" },
				desc = "Jump to previous snippet placeholder",
			},
			{
				"<c-h>",
				function()
					local ls = require("luasnip")
					if ls.choice_active() then
						require("luasnip").change_choice(-1)
					end
				end,
				mode = { "i", "s" },
				desc = "Use previous snippet choice",
			},
			{
				"<c-l>",
				function()
					local ls = require("luasnip")
					if ls.choice_active() then
						require("luasnip").change_choice(1)
					end
				end,
				mode = { "i", "s" },
				desc = "Use next snippet choice",
			},
		},
	},
}
