return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")

		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"bashls",
				"html",
				"emmet_ls",
				"pyright",
				"jsonls",
				"yamlls",
				"marksman",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier",
				"eslint",
				"shfmt",
				"jsonlint",
				"pylint",
				"yamllint",
			},
		})
	end,
	vim.keymap.set("n", "<leader>M", "<cmd>Mason<CR>", { desc = "Mason" }),
}
