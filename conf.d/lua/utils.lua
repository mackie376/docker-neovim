function remove_trailing_whitespace()
  local pos = vim.api.nvim_win_get_cursor(0)
  vim.cmd('%s/ \\+$//ge')
  vim.api.nvim_win_set_cursor(0, pos)

  if vim.api.nvim_buf_line_count(0) > 1 then
    while vim.api.nvim_buf_get_lines(0, -2, -1, true)[1] == '' do
      vim.api.nvim_buf_set_lines(0, -2, -1, true, {})
    end
  end
end

local utils = {}

local scopes = { o =  vim.o, b = vim.bo, w = vim.wo }
function utils.option(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then
    scopes['o'][key] = value
  end
end

function utils.map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function utils.hook_termopen()
  vim.cmd('autocmd TermOpen * setlocal nonumber')
  vim.cmd('autocmd TermOpen * setlocal norelativenumber')
  vim.cmd('autocmd TermOpen * startinsert')
end

function utils.hook_textyankpost()
  vim.cmd('autocmd TextYankPost * lua vim.highlight.on_yank { timeout = 100 }')
end

function utils.hook_bufwritepre()
  vim.cmd('autocmd BufWritePre * lua remove_trailing_whitespace()')
end

return utils;
