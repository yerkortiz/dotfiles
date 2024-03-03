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

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)


require("mason").setup({})

require'nvim-treesitter.configs'.setup {

    sync_install = false,

    auto_install = false,

    highlight = {

        enable = true,

        additional_vim_regex_highlighting = false,
  },
}

local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
  return
end

local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
  return
end


vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    sources = {
        { name = 'nvim_lsp'},
    },
})
