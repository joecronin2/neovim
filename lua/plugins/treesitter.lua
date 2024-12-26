return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		build = ":TSUpdate",
		config = function()
			local treesitter = require("nvim-treesitter.configs")
			treesitter.setup({
				ensure_installed = { "c", "latex", "markdown_inline", "lua", "vim", "typescript", "html" },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
				modules = {},
				ignore_install = {},
				auto_install = true,
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-space>",
						node_incremental = "<C-space>",
						scope_incremental = false,
						node_decremental = "<bs>",
					},
				},
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {},
		config = function()
			require("nvim-treesitter.configs").setup({
				textobjects = {
					move = {
						enable = true,
						set_jumps = true, -- whether to set jumps in the jumplist
						goto_next_start = {
							["<C-t>"] = { query = "@function.outer", desc = "Next function start" },
							["]f"] = { query = "@call.outer", desc = "Next function call start" },
							["<C-n>"] = { query = "@block.outer", desc = "Next block start" },

							["]c"] = { query = "@class.outer", desc = "Next class start" },
							["]i"] = { query = "@conditional.outer", desc = "Next conditional start" },
							["<C-l>"] = { query = "@loop.outer", desc = "Next loop start" },

							-- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
							-- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
							["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
							["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
						},
						goto_next_end = {
							["<C-S-t>"] = { query = "@function.outer", desc = "Next function end" },
							["<C-S-n>"] = { query = "@block.outer", desc = "Nextt block end" },
							["]F"] = { query = "@call.outer", desc = "Next function call end" },
							["]C"] = { query = "@class.outer", desc = "Next class end" },
							["]I"] = { query = "@conditional.outer", desc = "Next conditional end" },
						},
						goto_previous_start = {
							["<C-e>"] = { query = "@function.outer", desc = "Next function start" },
							["[f"] = { query = "@call.outer", desc = "Prev function call start" },
							["<C-o>"] = { query = "@block.outer", desc = "Prev block start" },

							["[c"] = { query = "@class.outer", desc = "Prev class start" },
							["[i"] = { query = "@conditional.outer", desc = "Prev conditional start" },
							["<C-s-l>"] = { query = "@loop.outer", desc = "Prev loop start" },
						},
						goto_previous_end = {
							["<C-S-e>"] = { query = "@function.outer", desc = "Prev function end" },
							["<C-S-o>"] = { query = "@block.outer", desc = "Prev block end" },
							["[F"] = { query = "@call.outer", desc = "Prev function call end" },
							["[M"] = { query = "@function.outer", desc = "Prev function end" },
							["[C"] = { query = "@class.outer", desc = "Prev class end" },
							["[I"] = { query = "@conditional.outer", desc = "Prev conditional end" },
						},
					},
					lsp_interop = {
						enable = true,
						border = "none",
						floating_preview_opts = {},
						peek_definition_code = {
							["<leader>df"] = "@function.outer",
							["<leader>dF"] = "@class.outer",
						},
					},
					select = {
						enable = true,

						-- Automatically jump forward to textobj, similar to targets.vim
						lookahead = true,

						keymaps = {
							-- You can use the capture groups defined in textobjects.scm
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["al"] = "@loop.outer",
							["il"] = "@loop.inner",
							["an"] = "@assignment.rhs",
							["ao"] = "@assignment.lhs",
							["ai"] = "@conditional.outer",
							["ii"] = "@conditional.inner",
							["ip"] = "@parameter.inner",
							["ap"] = "@parameter.outer",
							["ac"] = "@call.outer",
							["ic"] = "@call.inner",

							["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
						},

						-- You can choose the select mode (default is charwise 'v')
						--
						-- Can also be a function which gets passed a table with the keys
						-- * query_string: eg '@function.inner'
						-- * method: eg 'v' or 'o'
						-- and should return the mode ('v', 'V', or '<c-v>') or a table
						-- mapping query_strings to modes.
						selection_modes = {
							["@parameter.outer"] = "v", -- charwise
							["@function.outer"] = "V", -- linewise
							["@class.outer"] = "<c-v>", -- blockwise
						},
						-- If you set this to `true` (default is `false`) then any textobject is
						-- extended to include preceding or succeeding whitespace. Succeeding
						-- whitespace has priority in order to act similarly to eg the built-in
						-- `ap`.
						--
						-- Can also be a function which gets passed a table with the keys
						-- * query_string: eg '@function.inner'
						-- * selection_mode: eg 'v'
						-- and should return true or false
						include_surrounding_whitespace = true,
					},
				},
			})
		end,
	},
	{
		"Wansmer/treesj",
		-- keys = { "<leader>s", "<space>j", "<space>s" },
		dependencies = { "nvim-treesitter/nvim-treesitter" }, -- if you install parsers with `nvim-treesitter`
		config = function()
			local t = require("treesj")
			vim.keymap.set({ "n", "v" }, "<leader>st", function()
				t.toggle()
			end)
			vim.keymap.set({ "n", "v" }, "<leader>ss", function()
				t.split()
			end)
			vim.keymap.set({ "n", "v" }, "<leader>sj", function()
				t.join()
			end)
		end,
	},
}
