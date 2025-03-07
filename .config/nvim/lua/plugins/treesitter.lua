return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter-textobjects" }, -- syntax aware text objects
			"windwp/nvim-ts-autotag",
		},
		config = function()
			local config = require("nvim-treesitter.configs")
			local autotag = require("nvim-ts-autotag")
			autotag.setup({
				opts = {
					enable_close = true,
					enable_rename = true,
					enable_close_on_slash = true,
				},
			})

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
					"tsx",
					"jsdoc",
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-space>",
						node_incremental = "<C-space>",
						scope_incremental = false,
						node_decremental = "<bs>",
					},
				},
				sync_install = false,
				auto_install = true,
				text_objects = { select = { enable = true, lookahead = true } },
				highlight = { enable = true },
				indent = { enable = true },
				textobjects = {
					select = {
						enable = true,
						lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
						keymaps = {
							-- You can use the capture groups defined in textobjects.scm
							["ap"] = "@parameter.outer",
							["ip"] = "@parameter.inner",
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
						},
					},
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
			local treesitter_parser_config = require("nvim-treesitter.parsers").get_parser_configs()
			treesitter_parser_config.templ = {
				install_info = {
					url = "https://github.com/vrischmann/tree-sitter-templ.git",
					files = { "src/parser.c", "src/scanner.c" },
					branch = "master",
				},
			}

			vim.treesitter.language.register("templ", "templ")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		after = "nvim-treesitter",
		config = function()
			require("treesitter-context").setup({
				enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
				multiwindow = false, -- Enable multiwindow support.
				max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
				min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
				line_numbers = true,
				multiline_threshold = 20, -- Maximum number of lines to show for a single context
				trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
				mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
				-- Separator between context and content. Should be a single character string, like '-'.
				-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
				separator = nil,
				zindex = 20, -- The Z-index of the context window
				on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
			})
		end,
	},
}
