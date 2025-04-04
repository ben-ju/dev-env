-- return { -- LSP Configuration & Plugins
-- 	"neovim/nvim-lspconfig",
-- 	dependencies = {
-- 		-- Automatically install LSPs and related tools to stdpath for neovim
-- 		"williamboman/mason.nvim",
-- 		"williamboman/mason-lspconfig.nvim",
-- 		"WhoIsSethDaniel/mason-tool-installer.nvim",
--
-- 		-- Useful status updates for LSP.
-- 		-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
-- 		{
-- 			"j-hui/fidget.nvim",
-- 			tag = "v1.4.0",
-- 			opts = {
-- 				progress = {
-- 					display = {
-- 						done_icon = "✓", -- Icon shown when all LSP progress tasks are complete
-- 					},
-- 				},
-- 				notification = {
-- 					window = {
-- 						winblend = 0, -- Background color opacity in the notification window
-- 					},
-- 				},
-- 			},
-- 		},
-- 	},
-- 	config = function()
-- 		vim.api.nvim_create_autocmd("LspAttach", {
-- 			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
-- 			-- Create a function that lets us more easily define mappings specific LSP related items.
-- 			-- It sets the mode, buffer and description for us each time.
-- 			callback = function(event)
-- 				local map = function(keys, func, desc)
-- 					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
-- 				end
--
-- 				-- Jump to the definition of the word under your cursor.
-- 				--  This is where a variable was first declared, or where a function is defined, etc.
-- 				--  To jump back, press <C-T>.
-- 				map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
--
-- 				-- Find references for the word under your cursor.
-- 				map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
--
-- 				-- Jump to the implementation of the word under your cursor.
-- 				--  Useful when your language has ways of declaring types without an actual implementation.
-- 				map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
--
-- 				-- Jump to the type of the word under your cursor.
-- 				--  Useful when you're not sure what type a variable is and you want to see
-- 				--  the definition of its *type*, not where it was *defined*.
-- 				map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type Definition")
--
-- 				-- Fuzzy find all the symbols in your current document.
-- 				--  Symbols are things like variables, functions, types, etc.
-- 				map("<leader>fd", require("telescope.builtin").lsp_document_symbols, "Find Document Symbols")
--
-- 				-- Fuzzy find all the symbols in your current workspace
-- 				--  Similar to document symbols, except searches over your whole project.
-- 				map("<leader>fw", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Find Workspace Symbols")
--
-- 				-- Rename the variable under your cursor
-- 				--  Most Language Servers support renaming across files, etc.
-- 				map("<leader>cr", vim.lsp.buf.rename, "[R]e[n]ame")
--
-- 				-- Execute a code action, usually your cursor needs to be on top of an error
-- 				-- or a suggestion from your LSP for this to activate.
-- 				map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
--
-- 				-- Opens a popup that displays documentation about the word under your cursor
-- 				--  See `:help K` for why this keymap
-- 				map("K", vim.lsp.buf.hover, "Hover Documentation")
--
-- 				-- WARN: This is not Goto Definition, this is Goto Declaration.
-- 				--  For example, in C this would take you to the header
-- 				map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
--
-- 				map("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
-- 				map("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
-- 				map("<leader>wl", function()
-- 					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
-- 				end, "[W]orkspace [L]ist Folders")
--
-- 				-- The following two autocommands are used to highlight references of the
-- 				-- word under your cursor when your cursor rests there for a little while.
-- 				--    See `:help CursorHold` for information about when this is executed
-- 				--
-- 				-- When you move your cursor, the highlights will be cleared (the second autocommand).
-- 				local client = vim.lsp.get_client_by_id(event.data.client_id)
-- 				if client and client.server_capabilities.documentHighlightProvider then
-- 					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
-- 						buffer = event.buf,
-- 						callback = vim.lsp.buf.document_highlight,
-- 					})
--
-- 					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
-- 						buffer = event.buf,
-- 						callback = vim.lsp.buf.clear_references,
-- 					})
-- 				end
-- 			end,
-- 		})
--
-- 		local capabilities = vim.lsp.protocol.make_client_capabilities()
-- 		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
--
-- 		-- Enable the following language servers
-- 		local servers = {
-- 			html = { filetypes = { "html", "twig", "hbs" } },
-- 			lua_ls = {
-- 				-- cmd = {...},
-- 				-- filetypes { ...},
-- 				-- capabilities = {},
-- 				settings = {
-- 					Lua = {
-- 						runtime = { version = "LuaJIT" },
-- 						workspace = {
-- 							checkThirdParty = false,
-- 							-- Tells lua_ls where to find all the Lua files that you have loaded
-- 							-- for your neovim configuration.
-- 							library = {
-- 								"${3rd}/luv/library",
-- 							},
-- 							-- If lua_ls is really slow on your computer, you can try this instead:
-- 							-- library = { vim.env.VIMRUNTIME },
-- 						},
-- 						completion = {
-- 							callSnippet = "Replace",
-- 						},
-- 						telemetry = { enable = false },
-- 						diagnostics = { disable = { "missing-fields" } },
-- 					},
-- 				},
-- 			},
-- 			intelephense = {
-- 				settings = {
-- 					licenseKey = "009PSYLBDG3DBWA",
-- 					files = {
-- 						maxSize = 5000000, -- Support des fichiers volumineux
-- 					},
-- 					stubs = {
-- 						"bcmath",
-- 						"bz2",
-- 						"Core",
-- 						"curl",
-- 						"date",
-- 						"dom",
-- 						"fileinfo",
-- 						"filter",
-- 						"hash",
-- 						"json",
-- 						"libxml",
-- 						"mbstring",
-- 						"mysql",
-- 						"openssl",
-- 						"pcre",
-- 						"PDO",
-- 						"pdo_mysql",
-- 						"Phar",
-- 						"readline",
-- 						"Reflection",
-- 						"session",
-- 						"SimpleXML",
-- 						"soap",
-- 						"sodium",
-- 						"SPL",
-- 						"standard",
-- 						"tokenizer",
-- 						"xml",
-- 						"xmlreader",
-- 						"xmlwriter",
-- 						"zip",
-- 						"zlib",
-- 						"laravel",
-- 					},
-- 					environment = {
-- 						includePaths = {
-- 							-- "vendor/laravel/framework/src",
-- 							-- "vendor/spatie/laravel-permission/src",
-- 							-- "vendor/laravel/sanctum/src",
-- 							-- "vendor/inertiajs/inertia-laravel/src",
-- 							-- "vendor/fakerphp/faker/src",
-- 							"vendor",
-- 							-- "vendor/typesense/typesense-php/src",
-- 						},
-- 					},
-- 					diagnostics = {
-- 						enable = true,
-- 					},
-- 				},
-- 			},
-- 			ts_ls = {
-- 				settings = {
-- 					typescript = {
-- 						preferences = {
-- 							importModuleSpecifier = "relative",
-- 							jsxAttributeCompletionStyle = "braces",
-- 						},
-- 					},
-- 					javascript = {
-- 						preferences = {
-- 							importModuleSpecifier = "relative",
-- 						},
-- 					},
-- 				},
-- 				environment = {
-- 					includePaths = {
-- 						"node_modules",
-- 						"node_modules/@types",
-- 						"resources/js",
-- 					},
-- 				},
-- 			},
-- 			gopls = {
-- 				-- Command to start the gopls server with specific subcommand
-- 				cmd = { "gopls", "serve" }, -- 'serve' enables long-running server mode
--
-- 				-- File types that trigger this LSP
-- 				filetypes = { "go", "gomod", "gowork", "gotmpl" }, -- Covers Go and module files
--
-- 				-- How to find project root (important for module-aware mode)
-- 				-- root_dir = util.root_pattern("go.work", "go.mod", ".git"), -- Standard Go project markers
--
-- 				settings = {
-- 					gopls = {
-- 						-- Code analysis configurations
-- 						analyses = {
-- 							unusedparams = true, -- Warn about unused function parameters
-- 							shadow = true, -- Detect variable shadowing issues
-- 						},
--
-- 						-- Enable advanced static checking
-- 						staticcheck = true, -- Use Staticcheck linter
-- 						gofumpt = true, -- Enforce stricter formatting rules
--
-- 						-- Inlay hints configuration (type hints, parameter names, etc)
-- 						hints = {
-- 							assignVariableTypes = true, -- Show inferred types for variables
-- 							compositeLiteralFields = true, -- Show field names in struct literals
-- 							constantValues = true, -- Show constant values
-- 							functionTypeParameters = true, -- Show generic type parameters
-- 							parameterNames = true, -- Show parameter names in calls
-- 							rangeVariableTypes = true, -- Show loop variable types
-- 						},
--
-- 						-- Enhanced syntax highlighting
-- 						semanticTokens = true, -- Enable semantic token support
--
-- 						-- Build flags for conditional compilation
-- 						buildFlags = { "-tags=integration,e2e" }, -- Custom build tags
-- 					},
-- 				},
-- 			},
-- 		}
--
-- 		-- Ensure the servers and tools above are installed
-- 		require("mason").setup()
--
-- 		-- You can add other tools here that you want Mason to install
-- 		-- for you, so that they are available from within Neovim.
-- 		local ensure_installed = vim.tbl_keys(servers or {})
-- 		vim.list_extend(ensure_installed, {
-- 			"stylua", -- Used to format lua code
-- 		})
-- 		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
--
-- 		require("mason-lspconfig").setup({
-- 			handlers = {
-- 				function(server_name)
-- 					local server = servers[server_name] or {}
-- 					-- This handles overriding only values explicitly passed
-- 					-- by the server configuration above. Useful when disabling
-- 					-- certain features of an LSP (for example, turning off formatting for tsserver)
-- 					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
-- 					require("lspconfig")[server_name].setup(server)
-- 				end,
-- 			},
-- 		})
-- 	end,
-- }
return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"stevearc/conform.nvim",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"j-hui/fidget.nvim",
	},

	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
			-- Create a function that lets us more easily define mappings specific LSP related items.
			-- It sets the mode, buffer and description for us each time.

			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				-- Jump to the definition of the word under your cursor.
				--  This is where a variable was first declared, or where a function is defined, etc.
				--  To jump back, press <C-T>.
				map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

				-- Find references for the word under your cursor.
				map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

				-- Jump to the implementation of the word under your cursor.
				--  Useful when your language has ways of declaring types without an actual implementation.
				map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

				-- Jump to the type of the word under your cursor.
				--  Useful when you're not sure what type a variable is and you want to see
				--  the definition of its *type*, not where it was *defined*.
				map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type Definition")

				-- Fuzzy find all the symbols in your current document.
				--  Symbols are things like variables, functions, types, etc.
				map("<leader>fd", require("telescope.builtin").lsp_document_symbols, "Find Document Symbols")

				-- Fuzzy find all the symbols in your current workspace
				--  Similar to document symbols, except searches over your whole project.
				map("<leader>fw", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Find Workspace Symbols")

				-- Rename the variable under your cursor
				--  Most Language Servers support renaming across files, etc.
				map("<leader>cr", vim.lsp.buf.rename, "[R]e[n]ame")

				-- Execute a code action, usually your cursor needs to be on top of an error
				-- or a suggestion from your LSP for this to activate.
				map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

				-- Opens a popup that displays documentation about the word under your cursor
				--  See `:help K` for why this keymap
				map("K", vim.lsp.buf.hover, "Hover Documentation")

				-- WARN: This is not Goto Definition, this is Goto Declaration.
				--  For example, in C this would take you to the header
				map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

				map("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
				map("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
				map("<leader>wl", function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, "[W]orkspace [L]ist Folders")

				-- The following two autocommands are used to highlight references of the
				-- word under your cursor when your cursor rests there for a little while.
				--    See `:help CursorHold` for information about when this is executed
				--
				-- When you move your cursor, the highlights will be cleared (the second autocommand).
				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.server_capabilities.documentHighlightProvider then
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						callback = vim.lsp.buf.clear_references,
					})
				end
			end,
		})
		require("conform").setup({
			formatters_by_ft = {},
		})
		local cmp = require("cmp")
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)

		require("fidget").setup({})
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
				"gopls",
				"volar",
				"intelephense",
				"tsserver",
				"ts_ls",
			},
			handlers = {
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,

				zls = function()
					local lspconfig = require("lspconfig")
					lspconfig.zls.setup({
						root_dir = lspconfig.util.root_pattern(".git", "build.zig", "zls.json"),
						settings = {
							zls = {
								enable_inlay_hints = true,
								enable_snippets = true,
								warn_style = true,
							},
						},
					})
					vim.g.zig_fmt_parse_errors = 0
					vim.g.zig_fmt_autosave = 0
				end,
				-- ["volar"] = function()
				-- 	require("lspconfig").volar.setup({
				-- 		capabilities = capabilities,
				-- 		filetypes = { "typescript", "javascript", "vue" },
				-- 		settings = {
				-- 			volar = {
				-- 				autoCompleteParent = true,
				-- 				codeLens = {
				-- 					references = true,
				-- 					pugTools = true,
				-- 				},
				-- 			},
				-- 		},
				-- 	})
				-- end,
				["lua_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								runtime = { version = "Lua 5.1" },
								diagnostics = {
									globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
								},
							},
						},
					})
				end,
			},
		})

		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp", priority = 1000 },
				{ name = "luasnip", priority = 750 }, -- For luasnip users.
				{ name = "buffer", priority = 500 },
				{ name = "path", priority = 250 },
			}),
		})

		vim.diagnostic.config({
			update_in_insert = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})
	end,
}
