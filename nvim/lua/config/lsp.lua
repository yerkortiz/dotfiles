local langs = {
	c = "c",
	cpp = "cpp",
	go = "go",
	tex = "latex",
	lua = "lua",
}

local lspconfig = require('lspconfig')


lspconfig.gopls.setup({})
lspconfig.clangd.setup({})
lspconfig.texlab.setup({})
lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            },
        },
    },
})

require("mason").setup({})

require'nvim-treesitter.configs'.setup {
    ensure_installed = {
	    langs.lua,
    },

    sync_install = false,

    auto_install = false,

    highlight = {

        enable = true,

        additional_vim_regex_highlighting = false,
  },
}
