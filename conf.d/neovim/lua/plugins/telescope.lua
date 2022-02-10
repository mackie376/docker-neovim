local telescope  = require('telescope')
local actions    = require('telescope.actions')
local fb_actions = telescope.extensions.file_browser.actions

telescope.setup({
  defaults = {
    file_ignore_pattern = { 'node_modules', '.git' },
  },
  pickers = {
    buffers = {
      sort_lastused = true,
      mappings = {
        i = {
          ['<c-d>'] = actions.delete_buffer,
        },
        n = {
          ['dd'] = actions.delete_buffer,
        },
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = false,
      override_file_sorter    = true,
      case_mode               = 'smart_case',
    },
    file_browser = {
      mappings = {
        ['i'] = {
          ['<c-e>'] = fb_actions.create,
        },
      },
    },
  },
})

telescope.load_extension('vim_bookmarks')
telescope.load_extension('file_browser')
telescope.load_extension('fzf')
telescope.load_extension('neoclip')
telescope.load_extension('packer')
