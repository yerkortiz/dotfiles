return {
    {
        "neanias/everforest-nvim",
        priority = 1000,
        config = function()
            vim.g.everforest_background = "hard"
            vim.g.everforest_enable_italic = 1
            vim.cmd.colorscheme "everforest"
        end
    },
}
