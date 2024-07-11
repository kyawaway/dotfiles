require('mason').setup {
  ui = {
    check_outdated_packages_on_open = false,
    border = 'single',
  },
  registries = {
    "github:sankantsu/satysfi-mason-registry",
    "github:mason-org/mason-registry",
    "github:kyawaway/lmntal-mason-registry",
  },
}

require('mason-lspconfig').setup {
  ensure_installed = {
    'elmls',
    'satysfi_ls',
  },
}


require('mason-lspconfig').setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {}
  end,
}

require("satysfi-nvim").setup()
require("lspconfig").satysfi_ls.setup {}

require("lmntal-nvim").setup()
require("lspconfig").lmntal_ls.setup {}

local cmp_nvim_lsp = require "cmp_nvim_lsp"

require("lspconfig").clangd.setup {
  on_attach = on_attach,
  capabilities = cmp_nvim_lsp.default_capabilities(),
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  },
}
local null_ls = require 'null-ls'

require("mason-null-ls").setup({
    ensure_installed = {'stylua', 'jq'},
    handlers = {
        function() end, -- disables automatic setup of all null-ls sources
        stylua = function(source_name, methods)
          null_ls.register(null_ls.builtins.formatting.stylua)
        end,
        shfmt = function(source_name, methods)
          -- custom logic
          require('mason-null-ls').default_setup(source_name, methods) -- to maintain default behavior
        end,
    },
})
