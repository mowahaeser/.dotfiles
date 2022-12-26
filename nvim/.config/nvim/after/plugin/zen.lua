if not pcall(require, "zen-mode") then
    return
end

require("zen-mode").setup({
    window = {
        backdrop = 1,
        width = 1,
        -- height = 1,
        -- width = 150,
        options = {
            number = false,
            relativenumber = false,
            signcolumn = "no",
            list = false,
            cursorline = false,
        },
    },
})

require("twilight").setup({
    context = -1,
    treesitter = true,
})
