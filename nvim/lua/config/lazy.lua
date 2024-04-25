local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- lsp
local treesitter = "nvim-treesitter/nvim-treesitter"
local lsp = "neovim/nvim-lspconfig"
local mason =  "williamboman/mason.nvim"

--colorscheme
--local everforest = "neanias/everforest-nvim"
--local tokyonight = "folke/tokyonight.nvim"

-- telescope
local plenary = "nvim-lua/plenary.nvim"
local telescope = "nvim-telescope/telescope.nvim"
local telescope_fuzzy = {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
}

--cmp
local cmp_lsp = 'hrsh7th/cmp-nvim-lsp'
local cmp = 'hrsh7th/nvim-cmp'

-- snippets
local luasnip = 'L3MON4D3/LuaSnip'
local cmpsnip = 'saadparwaiz1/cmp_luasnip'

-- toggleterm
local toggleterm = "akinsho/toggleterm.nvim"

--neotree
local neotree = {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
}

--lualine
local lualine = {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
}

local bufferline = 'akinsho/bufferline.nvim'

local vimtex = 'lervag/vimtex'

local material_theme = 'marko-cerovac/material.nvim'

require("lazy").setup({
	treesitter,
	lsp,
	mason,
	--tokyonight,
    material_theme,
    plenary,
    telescope,
    telescope_fuzzy,
    cmp_lsp,
    cmp,
    luasnip,
    cmpsnip,
    toggleterm,
    neotree,
    lualine,
    bufferline,
    vimtex,
})
