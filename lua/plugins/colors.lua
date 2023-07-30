return {
    {
	'shaunsingh/solarized.nvim',
	priority = 1000,
	config = function()
	    vim.g.solarized_borders = true
	    vim.cmd.colorscheme 'solarized'
	    vim.opt.background = 'light'
	end,
    },
}
