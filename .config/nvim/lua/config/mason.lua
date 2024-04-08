require('mason').setup {
  ui = {
    check_outdated_packages_on_open = false,
    border = 'single',
  },
  registries = {
    "github:sankantsu/satysfi-mason-registry",
    "github:mason-org/mason-registry",
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
