-- Coloration syntaxique treesitter (échoue silencieusement si pas de parser)
vim.api.nvim_create_autocmd('FileType', {
    callback = function()
        pcall(vim.treesitter.start)
    end,
})

vim.api.nvim_set_hl(0, "@variable.member", { link = "@property" })
