return {
	{
		"nvim-telescope/telescope.nvim",
		config = function()
			vim.keymap.set("n", "<space><space>", ":Telescope find_files<enter>", { noremap = true })
			vim.keymap.set("n", ".", ":Telescope<enter>", { noremap = true })
		end,
	},

	{
		"nvim-telescope/telescope-ui-select.nvim",

		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
