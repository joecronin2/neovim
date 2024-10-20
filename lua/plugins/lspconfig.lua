return {
	{ "williamboman/mason.nvim", opts = {} },
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"pyright",
				"lua_ls",
				"bashls",
				"clangd",
				"jsonls",
				"cmake",
				"eslint",
				"html",
				"marksman",
				"ts_ls",
				"tailwindcss",
				"asm_lsp",
				"cssls",
				"mesonlsp",
				-- "html-lsp",
				"rust_analyzer",
				"emmet_language_server",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",

		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			local servers = {
				"clangd",
				"cssls",
				"bashls",
				"lua_ls",
				"asm_lsp",
				"mesonlsp",
				"jsonls",
				"eslint",
				"ts_ls",
				"rust_analyzer",
				"pyright",
				"html",
			}

			for _, lsp in ipairs(servers) do
				lspconfig[lsp].setup({
					capabilities = capabilities,
				})
			end
		end,
	},
}
