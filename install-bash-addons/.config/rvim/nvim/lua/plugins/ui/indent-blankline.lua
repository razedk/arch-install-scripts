return {
  	{
		'lukas-reineke/indent-blankline.nvim',
		main = 'ibl',
		event = 'VeryLazy',
		opts = function()
			return {
				indent = {
					-- See more characters at :h ibl.config.indent.char
					char = '▏', -- ▏│
					tab_char = '▏',
				},
				scope = { show_start = false, show_end = false },
				exclude = {
					filetypes = {
						'alpha',
						'checkhealth',
						'dashboard',
						'git',
						'gitcommit',
						'help',
						'lazy',
						'lazyterm',
						'lspinfo',
						'man',
						'mason',
						'neo-tree',
						'notify',
						'Outline',
						'TelescopePrompt',
						'TelescopeResults',
						'terminal',
						'toggleterm',
						'Trouble',
					},
				},
			}
		end,
	},
}
