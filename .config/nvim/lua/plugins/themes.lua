-- return {
-- 	{
-- 		"catppuccin/nvim",
-- 		lazy = false,
-- 		name = "catppuccin",
-- 		priority = 1000,
-- 		config = function()
-- 			-- vim.cmd.colorscheme("catppuccin")
-- 			-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- 			-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- 		end,
-- 	},
-- 	{
-- 		"folke/tokyonight.nvim",
-- 		lazy = false,
-- 		priority = 1000,
-- 		opts = {},
-- 		config = function()
-- 			vim.cmd.colorscheme("tokyonight-storm")
-- 			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- 			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- 		end,
-- 	},
-- }
-- function RemoveBackground()
-- 	-- local all_highlights = vim.fn.getcompletion("", "highlight")
-- 	-- for _, hl_group in ipairs(all_highlights) do
-- 	-- 	if hl_group:match("^Telescope") or hl_group:match("^lualine_") then
-- 	-- 		vim.api.nvim_set_hl(0, hl_group, { bg = "NONE" })
-- 	-- 	end
-- 	-- end
-- 	local highlights = {
-- 		"Normal",
-- 		"NormalFloat",
-- 		"NormalNC",
-- 		"CursorLine",
-- 		"SignColumn",
-- 		"LineNr",
-- 		"CursorLineNr",
-- 		"VertSplit",
-- 		"StatusLine",
-- 		"StatusLineNC",
-- 		"Pmenu",
-- 		"PmenuSel",
-- 		"PmenuSbar",
-- 		"PmenuThumb",
-- 		"TabLine",
-- 		"TabLineFill",
-- 		"TabLineSel",
-- 		"WinBar",
-- 		"WinBarNC",
-- 		"FloatBorder",
-- 		"TelescopeBorder",
-- 		"TelescopeNormal",
-- 		"TelescopePromptNormal",
-- 		"TelescopeSelection",
-- 		"TelescopeSelectionCaret",
-- 		"TelescopePreviewNormal",
-- 		"TelescopePromptBorder",
-- 		"TelescopeResultsBorder",
-- 		"TelescopePreviewBorder",
-- 		"TelescopePromptPrefix",
-- 		"lualine_a_normal",
-- 		"lualine_b_normal",
-- 		"lualine_c_normal",
-- 		"lualine_x_normal",
-- 		"lualine_y_normal",
-- 		"lualine_z_normal",
-- 		"lualine_a_command",
-- 		"lualine_a_inactive",
-- 		"lualine_a_insert",
-- 		"lualine_a_replace",
-- 		"lualine_a_visual",
-- 		"lualine_b_command",
-- 		"lualine_b_diff_added_command",
-- 		"lualine_b_diff_added_inactive",
-- 		"lualine_b_diff_added_insert",
-- 		"lualine_b_diff_added_normal",
-- 		"lualine_b_diff_added_replace",
-- 		"lualine_b_diff_added_terminal",
-- 		"lualine_b_diff_added_visual",
-- 		"lualine_b_diff_modified_command",
-- 		"lualine_b_diff_modified_inactive",
-- 		"lualine_b_diff_modified_insert",
-- 		"lualine_b_diff_modified_normal",
-- 		"lualine_b_diff_modified_replace",
-- 		"lualine_b_diff_modified_terminal",
-- 		"lualine_b_diff_modified_visual",
-- 		"lualine_b_diff_removed_command",
-- 		"lualine_b_diff_removed_inactive",
-- 		"lualine_b_diff_removed_insert",
-- 		"lualine_b_diff_removed_normal",
-- 		"lualine_b_diff_removed_replace",
-- 		"lualine_b_diff_removed_terminal",
-- 		"lualine_b_diff_removed_visual",
-- 		"lualine_b_inactive",
-- 		"lualine_b_insert",
-- 		"lualine_b_normal",
-- 		"lualine_b_replace",
-- 		"lualine_b_visual",
-- 		"lualine_c_command",
-- 		"lualine_c_inactive",
-- 		"lualine_c_insert",
-- 		"lualine_c_normal",
-- 		"lualine_c_replace",
-- 		"lualine_c_visual",
-- 		"lualine_x_diagnostics_error_command",
-- 		"lualine_x_diagnostics_error_inactive",
-- 		"lualine_x_diagnostics_error_insert",
-- 		"lualine_x_diagnostics_error_normal",
-- 		"lualine_x_diagnostics_error_replace",
-- 		"lualine_x_diagnostics_error_terminal",
-- 		"lualine_x_diagnostics_error_visual",
-- 		"lualine_x_diagnostics_hint_command",
-- 		"lualine_x_diagnostics_hint_inactive",
-- 		"lualine_x_diagnostics_hint_insert",
-- 		"lualine_x_diagnostics_hint_normal",
-- 		"lualine_x_diagnostics_hint_replace",
-- 		"lualine_x_diagnostics_hint_terminal",
-- 		"lualine_x_diagnostics_hint_visual",
-- 		"lualine_x_diagnostics_info_command",
-- 		"lualine_x_diagnostics_info_inactive",
-- 		"lualine_x_diagnostics_info_insert",
-- 		"lualine_x_diagnostics_info_normal",
-- 		"lualine_x_diagnostics_info_replace",
-- 		"lualine_x_diagnostics_info_terminal",
-- 		"lualine_x_diagnostics_info_visual",
-- 		"lualine_x_diagnostics_warn_command",
-- 		"lualine_x_diagnostics_warn_inactive",
-- 		"lualine_x_diagnostics_warn_insert",
-- 		"lualine_x_diagnostics_warn_normal",
-- 		"lualine_x_diagnostics_warn_replace",
-- 		"lualine_x_diagnostics_warn_terminal",
-- 		"lualine_x_diagnostics_warn_visual",
-- 		"TreesitterContext",
-- 		"TreesitterContextLineNumber",
-- 	}
-- 	vim.api.nvim_set_hl(0, "Visual", { bg = "#3a3a3a" })
-- 	-- local highlights = {
-- 	-- 	"Normal",
-- 	-- 	"NormalFloat",
-- 	-- 	"NormalNC",
-- 	-- 	"CursorLine",
-- 	-- 	"SignColumn",
-- 	-- 	"LineNr",
-- 	-- 	"CursorLineNr",
-- 	-- 	"VertSplit",
-- 	-- 	"StatusLine",
-- 	-- 	"StatusLineNC",
-- 	-- 	"Pmenu",
-- 	-- 	"PmenuSel",
-- 	-- 	"PmenuSbar",
-- 	-- 	"PmenuThumb",
-- 	-- 	"TabLine",
-- 	-- 	"TabLineFill",
-- 	-- 	"TabLineSel",
-- 	-- 	"WinBar",
-- 	-- 	"WinBarNC",
-- 	-- 	"FloatBorder",
-- 	-- 	"TelescopeNormal",
-- 	-- 	"TelescopePrompt",
-- 	-- 	"TelescopeResults",
-- 	-- 	"TelescopeSelection",
-- 	-- 	"TelescopePreviewNormal",
-- 	-- 	"TelescopeBorder",
-- 	-- 	"TelescopePromptBorder",
-- 	-- 	"TelescopeResultsBorder",
-- 	-- 	"TelescopePreviewBorder",
-- 	-- 	"TelescopePromptPrefix",
-- 	-- 	"TelescopePromptCounter",
-- 	-- 	"lualine_a_normal",
-- 	-- 	"lualine_b_normal",
-- 	-- 	"lualine_c_normal",
-- 	-- 	"lualine_x_normal",
-- 	-- 	"lualine_y_normal",
-- 	-- 	"lualine_z_normal",
-- 	-- }
-- 	for _, hl_group in ipairs(highlights) do
-- 		vim.api.nvim_set_hl(0, hl_group, { bg = "none" })
-- 	end
-- 	-- -- Set all specified highlight groups to have no background
-- 	-- for _, hl_group in ipairs(highlights) do
-- 	-- 	vim.api.nvim_set_hl(0, hl_group, { bg = "NONE" })
-- 	-- end
-- 	--
-- 	-- -- Catch-all approach to set all highlight groups with a background to NONE
-- 	-- local all_highlights = vim.fn.getcompletion("", "highlight")
-- 	-- for _, hl_group in ipairs(all_highlights) do
-- 	-- 	local current_hl = vim.api.nvim_get_hl_by_name(hl_group, true)
-- 	-- 	if current_hl.background then
-- 	-- 		vim.api.nvim_set_hl(0, hl_group, { bg = "NONE" })
-- 	-- 	end
-- 	-- end
-- 	--
-- 	-- -- Ensure Telescope highlights are properly set
-- 	-- vim.api.nvim_create_autocmd("FileType", {
-- 	-- 	pattern = "TelescopePrompt",
-- 	-- 	callback = function()
-- 	-- 		vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "NONE" })
-- 	-- 		vim.api.nvim_set_hl(0, "TelescopePrompt", { bg = "NONE" })
-- 	-- 		vim.api.nvim_set_hl(0, "TelescopeResults", { bg = "NONE" })
-- 	-- 		vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "NONE" })
-- 	-- 	end,
-- 	-- })
-- 	-- local highlights_to_clear = {
-- 	-- 	"Normal",
-- 	-- 	"NormalFloat",
-- 	-- 	"NormalNC",
-- 	-- 	"SignColumn",
-- 	-- 	"LineNr",
-- 	-- 	"VertSplit",
-- 	-- 	"StatusLine",
-- 	-- 	"StatusLineNC",
-- 	-- 	"TabLine",
-- 	-- 	"TabLineFill",
-- 	-- 	"WinBar",
-- 	-- 	"WinBarNC",
-- 	-- 	"FloatBorder",
-- 	-- 	"TelescopeNormal",
-- 	-- 	"TelescopePrompt",
-- 	-- 	"TelescopeResults",
-- 	-- 	"TelescopeBorder",
-- 	-- 	"TelescopePromptBorder",
-- 	-- 	"TelescopeResultsBorder",
-- 	-- 	"TelescopePreviewBorder",
-- 	-- 	"TelescopePromptPrefix",
-- 	-- 	"lualine_a_normal",
-- 	-- 	"lualine_b_normal",
-- 	-- 	"lualine_c_normal",
-- 	-- 	"lualine_x_normal",
-- 	-- 	"lualine_y_normal",
-- 	-- 	"lualine_z_normal",
-- 	-- }
-- 	--
-- 	-- -- Clear backgrounds for specified highlight groups
-- 	-- for _, hl_group in ipairs(highlights_to_clear) do
-- 	-- 	vim.api.nvim_set_hl(0, hl_group, { bg = "NONE" })
-- 	-- end
-- 	--
-- 	-- -- Preserve some visual elements
-- 	-- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2a2a2a" }) -- Subtle background for cursor line
-- 	-- vim.api.nvim_set_hl(0, "Visual", { bg = "#3a3a3a" }) -- Visual selection
-- 	-- vim.api.nvim_set_hl(0, "Pmenu", { bg = "#202020" }) -- Popup menu
-- 	-- vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#303030", fg = "white" }) -- Selected item in popup menu
-- 	-- vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "#303030", fg = "white" }) -- Selected item in Telescope
-- 	--
-- 	-- -- Ensure Telescope highlights are properly set
-- 	-- vim.api.nvim_create_autocmd("FileType", {
-- 	-- 	pattern = "TelescopePrompt",
-- 	-- 	callback = function()
-- 	-- 		vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "NONE" })
-- 	-- 		vim.api.nvim_set_hl(0, "TelescopePrompt", { bg = "NONE" })
-- 	-- 		vim.api.nvim_set_hl(0, "TelescopeResults", { bg = "NONE" })
-- 	-- 		vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "#303030", fg = "white" })
-- 	-- 	end,
-- 	-- })
-- end
-- function PrintAllHighlights()
-- 	local file = io.open("highlight_groups.txt", "w")
-- 	local highlights = vim.fn.getcompletion("", "highlight")
-- 	local output = ""
--
-- 	for _, hl_group in ipairs(highlights) do
-- 		local hl = vim.api.nvim_get_hl_by_name(hl_group, true)
-- 		if hl.background then
-- 			if output ~= "" then
-- 				output = output .. ", "
-- 			end
-- 			output = output .. '"' .. hl_group .. '"'
-- 		end
-- 	end
--
-- 	file:write(output)
-- 	file:close()
--
-- 	print("Highlight groups with backgrounds have been written to highlight_groups.txt")
-- end
function ColorMyPencils(color)
	color = color or "rose-pine-moon"
	vim.cmd.colorscheme(color)
	-- RemoveBackground()
	-- PrintAllHighlights()
end

return {

	{
		"erikbackman/brightburn.vim",
	},

	{
		"folke/tokyonight.nvim",
		lazy = false,
		opts = {},
		config = function()
			-- ColorMyPencils()
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		name = "gruvbox",
		config = function()
			require("gruvbox").setup({
				terminal_colors = true, -- add neovim terminal colors
				undercurl = true,
				underline = false,
				bold = true,
				italic = {
					strings = false,
					emphasis = false,
					comments = false,
					operators = false,
					folds = false,
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				invert_intend_guides = false,
				inverse = true, -- invert background for search, diffs, statuslines and errors
				contrast = "", -- can be "hard", "soft" or empty string
				palette_overrides = {},
				overrides = {},
				dim_inactive = false,
				transparent_mode = false,
			})
		end,
	},
	{
		"folke/tokyonight.nvim",
		-- config = function()
		-- 	require("tokyonight").setup({
		-- 		-- your configuration comes here
		-- 		-- or leave it empty to use the default settings
		-- 		style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
		-- 		transparent = true, -- Enable this to disable setting the background color
		-- 		terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
		-- 		styles = {
		-- 			-- Style to be applied to different syntax groups
		-- 			-- Value is any valid attr-list value for `:help nvim_set_hl`
		-- 			comments = { italic = false },
		-- 			keywords = { italic = false },
		-- 			-- Background styles. Can be "dark", "transparent" or "normal"
		-- 			sidebars = "dark", -- style for sidebars, see below
		-- 			floats = "dark", -- style for floating windows
		-- 		},
		-- 	})
		-- end,
	},

	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				-- disable_background = true,
				styles = {
					italic = false,
				},
			})

			-- ColorMyPencils()
		end,
	},
}
