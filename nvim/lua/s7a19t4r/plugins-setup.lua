-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed



-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end

-- :PackerCompile
-- :PackerClean
-- :PackerInstall
-- :PackerUpdate
-- :PackerSync
-- :PackerStatus

return packer.startup(function(use)
    use("wbthomason/packer.nvim") --packer

    --installed packages
    --color schemes
    use("folke/tokyonight.nvim")
    use("tanvirtin/monokai.nvim")
    
    use("nvim-lua/plenary.nvim")

    use("vim-airline/vim-airline") --status bar
    use("tpope/vim-surround") --surround keybindings
    use("numToStr/Comment.nvim") --comment with gc
    use("nvim-tree/nvim-tree.lua") --file explorer
    use("kyazdani42/nvim-web-devicons") --file icons for file explorer
    
    --autocompletion
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")

    --snippets
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    use("rafamadriz/friendly-snippets")

    --lsp
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")
    use("neovim/nvim-lspconfig")
    use("hrsh7th/cmp-nvim-lsp")
    use({"glepnir/lspsaga.nvim", branch = "main"})
    use("onsails/lspkind.nvim") --icons

    --formatting & linting
    use("jose-elias-alvarez/null-ls.nvim")
    use("jay-babu/mason-null-ls.nvim")

    --treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
    })

    --auto closing
    use("windwp/nvim-autopairs")
    use("windwp/nvim-ts-autotag")

    --git integration
    use("lewis6991/gitsigns.nvim")

    --debugger
    use("mfussenegger/nvim-dap")
    use({"rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"}})
    use("jay-babu/mason-nvim-dap.nvim")
    use ("theHamsta/nvim-dap-virtual-text")

    use({"iamcco/markdown-preview.nvim", run = function() vim.fn["mkdp#util#install"]() end,})
    
    if packer_bootstrap then
        require("packer").sync()
    end
end)
