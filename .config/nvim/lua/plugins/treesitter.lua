return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter-textobjects" }, -- syntax aware text objects
		},
		config = function()
			local config = require("nvim-treesitter.configs")

			config.setup({
				ensure_installed = {
					"lua",
					"javascript",
					"go",
					"html",
					"php",
					"typescript",
					"phpdoc",
					"json",
					"yaml",
					"css",
					"bash",
					"vim",
					"dockerfile",
					"gitignore",
					"sql",
					"xml",
					"vue",
					"bash",
					"luadoc",
					"nginx",
					"python",
					"regex",
					"scss",
					"tmux",
					"query",
					"tsx",
					"vimdoc",
					"c",
					"jsdoc",
				},

				-- enable indentation
				indent = { enable = true },
				-- enable autotagging (w/ nvim-ts-autotag plugin)
				autotag = { enable = true },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-space>",
						node_incremental = "<C-space>",
						scope_incremental = false,
						node_decremental = "<bs>",
					},
				},
				auto_install = false,
				text_objects = { select = { enable = true, lookahead = true } },
				highlight = { enable = true },
				textobjects = {
					move = {
						enable = true,
						set_jumps = true, -- whether to set jumps in the jumplist
						goto_next_start = {
							["]f"] = "@function.outer",
							["]c"] = "@class.outer",
							["]p"] = "@parameter.inner",
						},
						goto_next_end = {
							["]F"] = "@function.outer",
							["]C"] = "@class.outer",
							["]P"] = "@parameter.inner",
						},
						goto_previous_start = {

							["@f"] = "@function.outer",
							["@c"] = "@class.outer",
							["@p"] = "@parameter.inner",
						},
						goto_previous_end = {
							["@F"] = "@function.outer",
							["@C"] = "@class.outer",
							["@P"] = "@parameter.inner",
						},
					},
					swap = {
						enable = true,
						swap_next = {
							["spn"] = "@parameter.inner",
						},
						swap_previous = {
							["spp"] = "@parameter.inner",
						},
					},
				},
			})
		end,
	},
}
