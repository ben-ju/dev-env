return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- local custom_theme = require("lualine.themes.auto")
		-- -- Set all backgrounds to none
		-- for _, mode in pairs(custom_theme) do
		-- 	for _, section in pairs(mode) do
		-- 		section.bg = "none"
		-- 	end
		-- end
		require("lualine").setup({
			options = {
				theme = "auto",
				section_separators = "",
				component_separators = "",
				global_status = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff" },
				lualine_c = {
					{
						"filename",
						path = 1, -- 0: nom du fichier, 1: chemin relatif, 2: chemin absolu
						shorting_target = 40, -- Tronquer si le chemin est trop long
					},
					{
						function()
							local clients = vim.lsp.get_active_clients({ bufnr = 0 })
							if #clients == 0 then
								return "No LSP"
							end
							return clients[1].name
						end,
						icon = "", -- Icône avant "LSP"
					},
				},
				lualine_x = {
					{
						"diagnostics",
						sources = { "nvim_lsp" },
						sections = { "error", "warn", "info", "hint" },
						symbols = { error = "E:", warn = "W:", info = "I:", hint = "H:" }, -- Préfixes
						colored = true, -- Colore les diagnostics en fonction de leur gravité
						update_in_insert = false, -- Ne pas mettre à jour les diagnostics en mode insert
					},
					"encoding",
					"fileformat",
					"filetype",
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})
		-- Apply ColorMyPencils after Lualine setup
		vim.schedule(function()
			ColorMyPencils()
		end)
	end,
}
