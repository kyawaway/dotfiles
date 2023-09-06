return {
  { -- colorscheme
    'svrana/neosolarized.nvim',
    config = function()
      vim.cmd([[colorscheme neosolarized]])
    end
  },
  'editorconfig/editorconfig-vim',
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('config/lualine')
    end
  },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('config/comment')
    end
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('config/nvim-tree')
    end
  },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
-- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    "github/copilot.vim",
  },
  {
    "lervag/vimtex",
    ft = "tex",
    config = function()
      require('config/vimtex')
    end,
  },

-- lsp setting with mason.nvim, nvim-lspconfig, and mason-lspconfig.nvim
  {
    "williamboman/mason.nvim",
    config = function()
      require('config/mason')
    end,
    requires = {
    "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
    }
  },
  {
    "neovim/nvim-lspconfig",
  },
  {
    "williamboman/mason-lspconfig.nvim",
--    config = function()
--      require('config/mason-lsp')
--    end
  },
  {
    "hrsh7th/nvim-cmp",
--    config = function()
--      require ('config/cmp')
--    end,
--    dependencies = {
--      "hrsh7th/cmp-nvim-lsp",
--    }
    dependencies = {
     "hrsh7th/cmp-nvim-lsp",
   },
    opts = function()
--     vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
     local cmp = require("cmp")
     return {
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<S-CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
      }),
    }
  end,
  },
}
