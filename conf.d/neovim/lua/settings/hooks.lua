local cmd = vim.api.nvim_command

cmd('autocmd BufWritePre  * lua require("utils").remove_trailing_whitespace()')
cmd('autocmd TextYankPost * lua vim.highlight.on_yank({ timeout = 100 })')
cmd('autocmd TermOpen     * setlocal nonumber norelativenumber | startinsert')
cmd('autocmd TermClose    * call feedkeys("\\<Ignore>")')
