local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
  use { "wbthomason/packer.nvim", commit = "ea0cc3c"} -- Have packer manage itself
  use { "nvim-lua/plenary.nvim", tag ="v0.1.4" } -- Useful lua functions used by lots of plugins
  use { "goolord/alpha-nvim", commit = "0bb6fc0646bcd1cdb4639737a1cee8d6e08bcc31" } -- dashboard
  use { "folke/which-key.nvim" } -- show keybind compinations
  use { "nvim-tree/nvim-tree.lua", tag = "nightly", requires = "nvim-tree/nvim-web-devicons" }

  use { "windwp/nvim-autopairs", commit = "99f696339266c22e7313d6a85a95bd538c3fc226" }

  use {"ahmedkhalf/project.nvim", commit = "685bc8e3890d2feb07ccf919522c97f7d33b94e4"}

  use { "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons"} -- buffer / tab line
  use { "nvim-lualine/lualine.nvim", requires = "nvim-tree/nvim-web-devicons"}

  use { "moll/vim-bbye"}
  -- completion
  use { "hrsh7th/nvim-cmp", tag = "v0.0.1" }
  use { "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa"}
  use { "hrsh7th/cmp-path", commit ="91ff86cd9c29299a64f968ebb45846c485725f23"}
  use { "hrsh7th/cmp-cmdline", commit = "23c51b2a3c00f6abc4e922dbd7c3b9aca6992063"}
  use { "saadparwaiz1/cmp_luasnip", commit = "18095520391186d634a0045dacaa346291096566"}
  use { "hrsh7th/cmp-nvim-lsp", commit = "59224771f91b86d1de12570b4070fe4ad7cd1eeb"}

  -- snippets
  use { "L3MON4D3/LuaSnip", tag="v1.1.0"}
  use { "rafamadriz/friendly-snippets"}

  -- lsp 
  use { "neovim/nvim-lspconfig", tag="v0.1.3"}
  use { "williamboman/mason.nvim", commit = "2381f507189e3e10a43c3932a3ec6c2847180abc"}
  use { "williamboman/mason-lspconfig.nvim", commit = "0051870dd728f4988110a1b2d47f4a4510213e31" }
  use { "RRethy/vim-illuminate", commit = "a2e8476af3f3e993bb0d6477438aad3096512e42" } -- for text highlighting
  use { "glepnir/lspsaga.nvim", commit = "2eb8d023790099b182ac0c43d13dede80f42153e" } -- lsp ui

  use { "ron-rs/ron.vim"}

  -- Colorschemes
  use { "connorholyday/vim-snazzy", commit = "d979964b4dc0d6860f0803696c348c5a912afb9e" }
  use { "RRethy/nvim-base16"}

  -- Telescope
  use { "nvim-telescope/telescope.nvim", tag = "0.1.5", requires = { {'nvim-lua/plenary.nvim'} } }

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", tag ="v0.9.1",
        run = function()
          local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
          ts_update()
        end,
      }

  -- git
  use {"lewis6991/gitsigns.nvim", tag = "v0.5"}

  -- show color codes
  use {"NvChad/nvim-colorizer.lua"}

  -- yuck filetype for eww
  use {"https://github.com/elkowar/yuck.vim", commit = "9b5e0370f70cc30383e1dabd6c215475915fe5c3"}
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
