return {
    "binhtran432k/dracula.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
        require('dracula').setup({
            terminal_colors = true,
            style = "default",
            transparent = true,
            use_background = true,
            dim_inactive = true, -- Dim inactive windows
        })
        require('dracula').load()
    end
}