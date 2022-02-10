vim.g.vsnip_snippet_dir = vim.fn.stdpath('config') .. '/snippets'

local vsnip_keymap = function(lhs, rhs)
  local options = { expr = true, noremap = false, silent = true }
  vim.api.nvim_set_keymap('i', lhs, rhs, options)
  vim.api.nvim_set_keymap('s', lhs, rhs, options)
end

vsnip_keymap('<Tab>',   "vsnip#jumpable(1)  ? '<plug>(vsnip-jump-next)' : '<Tab>'")
vsnip_keymap('<S-Tab>', "vsnip#jumpable(-1) ? '<plug>(vsnip-jump-prev)' : '<S-Tab>'")
