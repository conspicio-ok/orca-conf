vim.lsp.enable({ "lua_ls" })
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if not client then return end
		client.server_capabilities.semanticTokensProvider = nil
		vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true})
	end,
})
