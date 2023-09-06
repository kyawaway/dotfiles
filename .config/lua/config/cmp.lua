require('cmp').setup(
  {
    mapping = {
      ['<C-p>'] = require('cmp').mapping.select_prev_item(),
      ['<C-n>'] = require('cmp').mapping.select_next_item(),
      ['<C-d>'] = require('cmp').mapping.scroll_docs(-4),
      ['<C-f>'] = require('cmp').mapping.scroll_docs(4),
      ['<C-Space>'] = require('cmp').mapping.complete(),
      ['<C-e>'] = require('cmp').mapping.close(),
      ['<CR>'] = require('cmp').mapping.confirm({
        behavior = require('cmp').ConfirmBehavior.Replace,
        select = true,
      }),
    },
    sources = {
      name = 'nvim_lsp',
    },
  })


--local capabilities = require('cmp_nvim_lsp').default_capabilities()
--  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
--  require('mason-lspconfig').setup {
--    capabilities = capabilities
--  }
