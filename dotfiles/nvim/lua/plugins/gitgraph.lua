local gitgraphOk, gitgraph = pcall(require, "gitgraph")
if gitgraphOk then
    gitgraph.setup({
        format = {
            timestamp = "%d/%m/%Y %H:%M",
            fields    = { "hash", "timestamp", "author", "branch_name", "tag" },
        },
    })
end
