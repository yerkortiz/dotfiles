return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            require("mason").setup()

            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            vim.lsp.config.lua_ls = {
                capabilities = capabilities,
                root_dir = vim.fs.dirname(vim.fs.find({ ".luarc.json", ".git" }, { upward = true })[1]),
            }

            vim.lsp.config.clangd = {
                capabilities = capabilities,
            }

            vim.lsp.config.pyright = {
                capabilities = capabilities,
            }

            vim.api.nvim_create_autocmd("FileType", {
                pattern = "lua",
                callback = function()
                    vim.lsp.start(vim.lsp.config.lua_ls)
                end,
            })
            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "c", "cpp" },
                callback = function()
                    vim.lsp.start(vim.lsp.config.clangd)
                end,
            })
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "python",
                callback = function()
                    vim.lsp.start(vim.lsp.config.pyright)
                end,
            })

            local cmp = require("cmp")
            local luasnip = require("luasnip")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                }),
                sources = {
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                },
            })
        end,
    }
}
