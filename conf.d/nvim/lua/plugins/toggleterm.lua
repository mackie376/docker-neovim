require('toggleterm').setup({
  open_mapping    = '<c-z>',
  direction       = 'float',
  shade_terminals = true,
  float_opts      = {
    border     = 'curved',
    winblend   = 0,
    highlights = {
      background = 'Normal',
      border     = 'Normal',
    },
  },
})
