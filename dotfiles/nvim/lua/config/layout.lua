local map = vim.keymap.set
local nvimTreeOk = pcall(require, "nvim-tree")
local gitgraphOk, gitgraph = pcall(require, "gitgraph")

local function findWin(ft)
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        if vim.bo[vim.api.nvim_win_get_buf(win)].filetype == ft then
            return win
        end
    end
    return nil
end

local function openLayout()
    if not nvimTreeOk or not gitgraphOk then return end

    local treeWin = findWin("NvimTree")
    if treeWin == nil then
        vim.cmd("NvimTreeOpen")
        treeWin = findWin("NvimTree")
    end
    if treeWin == nil then return end

    local graphWin = findWin("gitgraph")
    if graphWin == nil then
        local isGitRepo = vim.fn.systemlist("git rev-parse --git-dir")[1] ~= nil
            and vim.v.shell_error == 0
        if isGitRepo then
            vim.api.nvim_set_current_win(treeWin)
            vim.cmd("belowright split")
            vim.cmd("resize 22")
            gitgraph.draw({}, { all = true, max_count = 256 })
            vim.cmd("redraw!")
        end
    end

    vim.cmd("wincmd l")
end

map("n", "<F2>", "<cmd>NvimTreeFocus<CR>", { silent = true })
map("n", "<F3>", openLayout,               { silent = true })
