require('lualine').setup({
  options = {
    theme = 'nightfox',
    icon_enabled = true,
  },
  sections = {
    lualine_a = { { 'mode', uppper = true }, },
    lualine_b = { 'branch' },
    lualine_c = { { 'diagnostics', source = { 'nvim_diagnostic' } } },
    lualine_x = {
      {
        'lsp_progress',
        display_components = { 'lsp_client_name', { 'title', 'percentage' }, 'spinner' },
        spinner_symbols = { '🌑 ', '🌒 ', '🌓 ', '🌔 ', '🌕 ', '🌖 ', '🌗 ', '🌘 ' },
      },
      { 'fileformat' },
      { 'filetype' },
      { 'encoding' },
    },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },
  inactive_sections = {
    lualine_a = { },
    lualine_b = { },
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = { },
    lualine_z = { },
  },
  tabline = {
    lualine_a = { 'tabs' },
    lualine_b = { { 'filename', file_status = true } },
    lualine_c = { },
    lualine_x = {  },
    lualine_y = { },
    lualine_z = { },
  },
})
