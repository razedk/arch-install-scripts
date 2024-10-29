return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		keys = {
			{ "<leader>e", "<Cmd>Neotree focus<CR>", desc = "Give focus to Neotree window" },
			{ "<leader>fe", "<Cmd>Neotree filesystem<CR>", desc = "Show filesystem in Neotree window" },
			{ "<leader>be", "<Cmd>Neotree buffers<CR>", desc = "Show open buffers in Neotree window" },
			{ "<leader>ge", "<Cmd>Neotree git_status<CR>", desc = "Show git status in Neotree window" },
			{ "<leader>ft", "<Cmd>Neotree toggle<CR>", desc = "Show/hide Neotree window" },
		},
		opts = {
			filesystem = {
				follow_current_file = { enabled = true },
				use_libuv_file_watcher = true,
			},
		},
	},
}
