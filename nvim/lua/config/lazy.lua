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

-- lesp
local treesitter = "nvim-treesitter/nvim-treesitter"
local lsp = "neovim/nvim-lspconfig"
local mason =  "williamboman/mason.nvim"

--colorscheme
local everforest = "neanias/everforest-nvim"

-- telescope
local plenary = "nvim-lua/plenary.nvim"
local telescope = "nvim-telescope/telescope.nvim"
local telescope_fuzzy = {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
}


require("lazy").setup({
	treesitter,
	lsp,
	mason,
	everforest,
    plenary,
    telescope,
    telescope_fuzzy,
})
