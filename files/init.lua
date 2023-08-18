vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.textwidth = 80

-- ========================================================================== --
-- ==                             KEYBINDINGS                              == --
-- ========================================================================== --

-- Space as leader key
vim.g.mapleader = ' '
vim.g["grammarous#jar_url"] = 'https://www.languagetool.org/download/LanguageTool-5.9.zip'

vim.diagnostic.config({
  virtual_text = false,
})

require('plugins')


-- examples for your init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true


-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})


local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {}
    }
}
require'lspconfig'.clangd.setup{}
-- require('lspconfig')['ccls'].setup{}
require('lspconfig')['ltex'].setup{
	settings = {
	ltex = {
			-- language = "en",
			language = "de-DE",
		},
	},
}

vim.env.GITHUB_API_TOKEN = "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"
require("cmp_git").setup({filetypes={"*",}})
-- Set up nvim-cmp.
local cmp = require('cmp')

cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		 documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
	},
	{{ name = "git" }},
		-- { name = 'vsnip' }, -- For vsnip users.
		{{ name = 'luasnip' }}, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
		{{ name = 'path' }},
		{
		{ name = 'buffer' },
	})
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'git' }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = 'buffer' },
	})
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})

require('hop').setup()
require('lualine').setup()

require('gitsigns').setup {
  signs = {
    add          = { text = '│' },
    change       = { text = '│' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm = {
    enable = false
  },
}

-- telescope keyboard shortcuts
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>t', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>e', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

vim.keymap.set('n', ']g', vim.diagnostic.goto_next, {})
vim.keymap.set('n', '[g', vim.diagnostic.goto_prev, {})
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
vim.keymap.set('n', '<leader><leader>', ":b #<Return>", {})
vim.keymap.set({ 'n', 'v' }, '<space>a', vim.lsp.buf.code_action, opts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line diagnostic" })
vim.keymap.set("n", "<leader>dw", ":Telescope diagnostics<CR>", { desc = "Diagnostics in telescope" })


vim.keymap.set('n', '<leader>g', ":LazyGit<Return>", {})
vim.keymap.set('n', '<leader>bl', ":Gitsigns blame_line<Return>", {})
vim.keymap.set('n', '<leader>hr', ":Gitsigns reset_hunk<CR>", {})
vim.keymap.set('n', '<leader>hp', ":Gitsigns preview_hunk<CR>", {})
vim.keymap.set('n', '<leader>w', ":HopWord<Return>", {})
vim.keymap.set('n', '<leader>l', ":HopLine<Return>", {})

-- better movement 
vim.keymap.set('n', '<c-k>', ":wincmd k<CR>", {})
vim.keymap.set('n', '<c-j>', ":wincmd j<CR>", {})
vim.keymap.set('n', '<c-h>', ":wincmd h<CR>", {})
vim.keymap.set('n', '<c-l>', ":wincmd l<CR>", {})

vim.cmd [[colorscheme tokyonight]]

-- Custom funcions
vim.keymap.set("n", 'gj', ":%!python -m json.tool", {})
vim.api.nvim_create_user_command("CompileMain", 
	function()
		local handle = io.popen("cd build && ninja")
		local compileResult = handle:read("*a")
		handle:close()
		local fail = "ninja: build stopped: subcommand failed."
		if (string.find(compileResult, fail)) then
			vim.cmd("vsplit __compile_result__")
			vim.cmd("normal! ggdG")
			vim.cmd("setlocal buftype=nofile")
			vim.cmd("call append(0, split(compileResult,'\v\n'))")
		else 
			vim.cmd("echo 'build success'")
		end
	end,
	{}
)
-- vim.keymap.set("n", "cm", ":call CompileMain()", {})
