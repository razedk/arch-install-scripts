return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		-- call the setup function with properties to define how our lualine will look
		require("lualine").setup({
			options = {
				-- Use web devicons if you have a nerdfont installed
				icons_enabled = true,
				-- Set the theme to auto, this will load colors from active colorscheme, lualine documentation has other themes available as well
				theme = "auto",
				-- Separate components of lua line with chevrons
				component_separators = { left = "", right = "" },
				-- Separate sections with solid triangles
				section_separators = { left = "", right = "" },
				-- disable the status line and winbar
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				-- Don't focus lualine on xxx
				ignore_focus = {},
				-- Always divide lualine in the middle
				always_divide_middle = true,
				-- Disable global status
				globalstatus = false,
				-- Refresh every 1000 miliseconds
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			-- Setup what each lualine section will contain
			-- sections start at a on the left and go to z on the right
			sections = {
				-- display the current mode in section a
				lualine_a = { "mode" },
				-- display the current git branch, git differences, and any code diagnostics in section b
				lualine_b = { "branch", "diff", "diagnostics" },
				-- display the filename in section c
				lualine_c = { "filename" },
				-- display the file encoding type, os, and filetype in section x
				lualine_x = {
					"encoding",
					"fileformat",
					"filetype",
					"lsp_status",
				},
				-- display where you are at in the file in section y
				lualine_y = { "progress" },
				-- display exact location of the cursor in section z
				lualine_z = { "location" },
			},
			-- Setup what each section will contain in inactive buffers
			inactive_sections = {
				-- display nothing in sections a and b
				-- display the current mode in section a
				lualine_a = { "mode" },
				-- display the current git branch, git differences, and any code diagnostics in section b
				lualine_b = { "branch", "diff", "diagnostics" },
				-- display the filename in section c
				lualine_c = { "filename" },
				-- display the file encoding type, os, and filetype in section x
				lualine_x = {
					"encoding",
					"fileformat",
					"filetype",
					"lsp_status",
				},
				-- display where you are at in the file in section y
				lualine_y = { "progress" },
				-- display exact location of the cursor in section z
				lualine_z = { "location" },
			},
			-- Use default values for tabline, winbar, inactive winbar and extensions
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = { "neo-tree", "lazy" },
		})
	end,
}
