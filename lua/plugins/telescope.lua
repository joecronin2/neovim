-- plugins/telescope.lua:
return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	-- or                              , branch = '0.1.x',
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"xiyaowong/telescope-emoji.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
		},
		"nvim-telescope/telescope-frecency.nvim",
	},
	config = function()
		-- You dont need to set any of these options. These are the default ones. Only
		-- the loading is important
		local telescope = require("telescope")
		telescope.setup({
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					-- the default case_mode is "smart_case"
				},
			},
		})
		-- To get fzf loaded and working with telescope, you need to call
		-- load_extension, somewhere after setup function:
		telescope.load_extension("fzf")
		telescope.load_extension("frecency")
		telescope.load_extension("emoji")
		telescope.load_extension("file_browser")
	end,
}
