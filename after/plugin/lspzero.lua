local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
	"tsserver",
	-- 'sumneko_lua',
	"rust_analyzer",
})

-- Fix Undefined global 'vim'
lsp.configure("sumneko_lua", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-y>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings["<Tab>"] = cmp.mapping.select_next_item(cmp_select)
cmp_mappings["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select)

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
})

lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = "E",
		warn = "W",
		hint = "H",
		info = "I",
	},
})

lsp.on_attach(function(client, bufnr)
	if client.name == "tsserver" then
		--  deprecated resolved_capabilities
		-- client.resolved_capabilities.documents_formatting = false
		client.server_capabilities.documents_formatting = false
	end
	local opts = { buffer = bufnr, remap = false }

	-- LSP hover
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	-- LSP workspace_symbol
	vim.keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	-- LSP buf code_action
	vim.keymap.set("n", "<leader>a", function()
		vim.lsp.buf.code_action()
	end, opts)
	-- LSP buf references
	vim.keymap.set("n", "<leader>vrr", function()
		vim.lsp.buf.references()
	end, opts)
	-- LSP buf rename
	vim.keymap.set("n", "<leader>vrn", function()
		vim.lsp.buf.rename()
	end, opts)
	-- LSP open_float
	vim.keymap.set("n", "<leader>d", function()
		vim.diagnostic.open_float()
	end, opts)
	-- LSP diagnostic goto_next
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_next()
	end, opts)
	-- LSP diagnostic goto_prev
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_prev()
	end, opts)
	-- LSP go to definition
	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
end)

lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
})
