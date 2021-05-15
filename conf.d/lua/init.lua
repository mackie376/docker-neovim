local utils = require('utils')

vim.cmd('filetype indent plugin off')
vim.cmd('syntax off')

require('options')
require('keys')
require('dein')

utils.hook_termopen()
utils.hook_textyankpost()
utils.hook_bufwritepre()

vim.cmd('filetype indent plugin on')
vim.cmd('syntax on')
