local nvimTreeOk, nvimTree = pcall(require, "nvim-tree")
if nvimTreeOk then
    nvimTree.setup({
        view = {
            width = 32,
            side  = "left",
        },
        renderer = {
            icons = {
                show = {
                    file         = false,
                    folder       = false,
                    folder_arrow = true,
                    git          = false,
                },
            },
        },
        update_focused_file = {
            enable = true,
        },
        filters = {
            dotfiles = false,
        },
    })
end
