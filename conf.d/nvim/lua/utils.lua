local _M = {}

local api = vim.api
local cmd = api.nvim_command

_M.remove_trailing_whitespace = function()
  local pos = api.nvim_win_get_cursor(0)
  cmd('%s/ \\+$//ge')
  api.nvim_win_set_cursor(0, pos)

  if api.nvim_buf_line_count(0) > 1 then
    while api.nvim_buf_get_lines(0, -2, -1, true)[1] == '' do
      api.nvim_buf_set_lines(0, -2, -1, true, {})
    end
  end
end

_M.keymap = function(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  api.nvim_set_keymap(mode, lhs, rhs, options)
end

return _M
