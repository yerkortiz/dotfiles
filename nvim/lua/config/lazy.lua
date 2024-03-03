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

local treesitter = "nvim-treesitter/nvim-treesitter"
local lsp = "neovim/nvim-lspconfig"
local mason =  "williamboman/mason.nvim"
local everforest = "neanias/everforest-nvim"


require("lazy").setup({
	treesitter,
	lsp,
	mason,
	everforest,
})
