return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

	-- Use the configurations for the lsp
	use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP

	use 'nvim-treesitter/nvim-treesitter'
	use {
  	'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                            , branch = '0.1.x',
  	requires = { {'nvim-lua/plenary.nvim'} }
	}
	use {
  	'nvim-tree/nvim-tree.lua',
  	requires = {
    	'nvim-tree/nvim-web-devicons', -- optional, for file icons
  	},
  	tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'
	use {
  	'phaazon/hop.nvim',
  	branch = 'v2', -- optional but strongly recommended
  	config = function()
    	-- you can configure Hop the way you like here; see :h hop-config
    	require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
  	end
	}
	use {
  	'nvim-lualine/lualine.nvim',
  	requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	use { "bluz71/vim-nightfly-colors", as = "nightfly" }
	use 'kdheepak/lazygit.nvim'
	use {
  	'lewis6991/gitsigns.nvim',
	}
	use 'mg979/vim-visual-multi'
	use {
  "ahmedkhalf/project.nvim",
  config = function()
    require("project_nvim").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}
use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
}
  use {
    'renerocksai/telekasten.nvim',
  }
	use({"petertriho/cmp-git", requires = "nvim-lua/plenary.nvim"})
	use{"rhysd/vim-grammarous"}
	use {
    's1n7ax/nvim-window-picker',
    tag = 'v1.*',
    config = function()
        require'window-picker'.setup({
					other_win_hl_color = '#503b5c',
					filter_rules = {
        -- filter using buffer options
        bo = {
            -- if the file type is one of following, the window will be ignored
            filetype = {},

            -- if the buffer type is one of following, the window will be ignored
            buftype = {},
        },}
				})
    end,
	}
	use 'folke/tokyonight.nvim'
	use 'chentoast/marks.nvim'
	use 'lervag/vimtex'
	-- install without yarn or npm
	-- use({ "iamcco/markdown-preview.nvim", run = function() vim.fn["mkdp#util#install"]() end, })
	-- use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
	-- use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}
	use { 'iamcco/markdown-preview.nvim' }

end)
