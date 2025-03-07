-- return {
-- 	{
-- 		"hrsh7th/nvim-cmp",
-- 		event = "InsertEnter",
-- 		dependencies = {
-- 			"hrsh7th/cmp-nvim-lsp",
-- 			"onsails/lspkind.nvim", -- vscode pictograms
-- 			"hrsh7th/cmp-path",
-- 			"hrsh7th/cmp-buffer",
-- 			{ "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
-- 			"saadparwaiz1/cmp_luasnip",
-- 		},
--
-- 		config = function()
-- 			local cmp = require("cmp")
-- 			local lspkind = require("lspkind")
-- 			local luasnip = require("luasnip")
--
-- 			-- require("luasnip.loaders.from_vscode").lazy_load()
-- 			cmp.setup({
-- 				snippet = {
-- 					-- REQUIRED - you must specify a snippet engine
-- 					expand = function(args)
-- 						luasnip.lsp_expand(args.body) -- For `luasnip` users.
-- 					end,
-- 				},
-- 				completion = {
-- 					completeopt = "menu,menuone,preview,noselect",
-- 				},
-- 				window = {
-- 					completion = cmp.config.window.bordered(),
-- 					documentation = cmp.config.window.bordered(),
-- 				},
-- 				mapping = cmp.mapping.preset.insert({
-- 					["<C-b>"] = cmp.mapping.scroll_docs(-4),
-- 					["<C-f>"] = cmp.mapping.scroll_docs(4),
-- 					["<C-Space>"] = cmp.mapping.complete(),
-- 					["<C-n>"] = cmp.mapping.select_next_item(), -- Descendre
-- 					["<C-p>"] = cmp.mapping.select_prev_item(), -- Monter
-- 					["<C-e>"] = cmp.mapping.abort(),
-- 					["<Tab>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
-- 				}),
-- 				sources = cmp.config.sources({
-- 					{ name = "nvim_lsp" },
-- 					{ name = "luasnip" }, -- For luasnip users.
-- 					{ name = "buffer" },
-- 					{ name = "path" },
-- 				}),
-- 				formatting = {
-- 					format = lspkind.cmp_format({
-- 						mode = "symbol_text", -- Affiche le symbole et le texte
-- 						maxwidth = 50, -- Limite la largeur du popup
-- 						ellipsis_char = "...", -- Ajoute des ellipses si le texte dépasse maxwidth
-- 						before = function(entry, vim_item)
-- 							-- Ajoutez la source des suggestions dans le champ `menu`
-- 							vim_item.menu = ({
-- 								nvim_lsp = "[LSP]",
-- 								luasnip = "[Snippet]",
-- 								buffer = "[Buffer]",
-- 								path = "[Path]",
-- 							})[entry.source.name]
-- 							return vim_item
-- 						end,
-- 					}),
-- 				},
-- 			})
-- 		end,
-- 	},
-- }
return {
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp",

        dependencies = { "rafamadriz/friendly-snippets" },

        config = function()
            local ls = require("luasnip")
            ls.filetype_extend("javascript", { "jsdoc" })

            --- TODO: What is expand?
            vim.keymap.set({"i"}, "<C-s>e", function() ls.expand() end, {silent = true})

            vim.keymap.set({"i", "s"}, "<C-s>;", function() ls.jump(1) end, {silent = true})
            vim.keymap.set({"i", "s"}, "<C-s>,", function() ls.jump(-1) end, {silent = true})

            vim.keymap.set({"i", "s"}, "<C-E>", function()
                if ls.choice_active() then
                    ls.change_choice(1)
                end
            end, {silent = true})
        end,
    }
}
