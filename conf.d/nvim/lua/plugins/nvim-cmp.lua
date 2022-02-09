local cmp     = require('cmp')
local mapping = cmp.mapping
local lspkind = require('lspkind')

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn['vsnip#anonymous'](args.body)
    end,
  },
  mapping = {
    ['<Tab>']     = mapping(mapping.select_next_item(), { 'i', 's' }),
    ['<S-Tab>']   = mapping(mapping.select_prev_item(), { 'i', 's' }),
    ['<c-space>'] = mapping(mapping.complete(), { 'i', 'c' }),
    ['<c-b>']     = mapping(mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<c-f>']     = mapping(mapping.scroll_docs(4), { 'i', 'c' }),
    ['<c-y>']     = cmp.config.disable,
    ['<c-e>']     = mapping({ i = mapping.abort(), c = mapping.close() }),
    ['<cr>']      = mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  }, {
    { name = 'buffer' },
  }),
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol',
      maxwidth = 50,
    })
  }
})

cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' },
  }
})

cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' },
  }, {
    { name = 'cmdline' },
  })
})
