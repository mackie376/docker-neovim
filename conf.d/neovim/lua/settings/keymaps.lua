local keymap = require('utils').keymap

-- leader
vim.g.mapleader = ' '

-- alias
keymap('n', '[bookmark]', '<nop>', { noremap = true, silent = false })
keymap('n', '[buffer]',   '<nop>', { noremap = true, silent = false })
keymap('n', '[clip]',     '<nop>', { noremap = true, silent = false })
keymap('n', '[execute]',  '<nop>', { noremap = true, silent = false })
keymap('n', '[file]',     '<nop>', { noremap = true, silent = false })
keymap('n', '[git]',      '<nop>', { noremap = true, silent = false })
keymap('n', '[lsp]',      '<nop>', { noremap = true, silent = false })
keymap('n', '[project]',  '<nop>', { noremap = true, silent = false })
keymap('n', '[quit]',     '<nop>', { noremap = true, silent = false })
keymap('n', '[search]',   '<nop>', { noremap = true, silent = false })

-- 1st stroke
keymap('n', '<leader>b', '[buffer]',   { noremap = false, silent = false })
keymap('n', '<leader>c', '[clip]',     { noremap = false, silent = false })
keymap('n', '<leader>f', '[file]',     { noremap = false, silent = false })
keymap('n', '<leader>g', '[git]',      { noremap = false, silent = false })
keymap('n', '<leader>l', '[lsp]',      { noremap = false, silent = false })
keymap('n', '<leader>m', '[bookmark]', { noremap = false, silent = false })
keymap('n', '<leader>p', '[project]',  { noremap = false, silent = false })
keymap('n', '<leader>q', '[quit]',     { noremap = false, silent = false })
keymap('n', '<leader>s', '[search]',   { noremap = false, silent = false })
keymap('n', '<leader>x', '[execute]',  { noremap = false, silent = false })

-- basic
keymap('n', '<esc><esc>', '<cmd>nohlsearch<cr><esc>')
keymap('n', 'x',          '"_x')
keymap('n', 'D',          '"_D')
keymap('i', '<c-l>',      '<c-r>=lexima#insmode#leave(1, "<LT>C-G>U<LT>RIGHT>")<cr>')
keymap('i', 'jk',         '<esc>')
keymap('t', '<c-g>',      '<c-\\><c-n>')

-- bookmark
keymap('n', '[bookmark]g', '<plug>BookmarkMoveToLine', { noremap = false, silent = true })
keymap('n', '[bookmark]i', '<plug>BookmarkAnnotate',   { noremap = false, silent = true })
keymap('n', '[bookmark]j', '<plug>BookmarkMoveDown',   { noremap = false, silent = true })
keymap('n', '[bookmark]k', '<plug>BookmarkMoveUp',     { noremap = false, silent = true })
keymap('n', '[bookmark]l', '<cmd>Telescope vim_bookmarks<cr>')
keymap('n', '[bookmark]m', '<plug>BookmarkToggle',     { noremap = false, silent = true })
keymap('n', '[bookmark]n', '<plug>BookmarkNext',       { noremap = false, silent = true })
keymap('n', '[bookmark]p', '<plug>BookmarkPrev',       { noremap = false, silent = true })
keymap('n', '[bookmark]x', '<plug>BookmarkClear',      { noremap = false, silent = true })

-- buffer
keymap('n', '[buffer]b', '<cmd>Telescope buffers<cr>')
keymap('n', '[buffer]c', '<cmd>bd<cr>')
keymap('n', '[buffer]d', '<cmd>bw<cr>')
keymap('n', '[buffer]n', '<cmd>bn<cr>')
keymap('n', '[buffer]p', '<cmd>bp<cr>')

-- clipboard
keymap('n', '[clip]c', '<cmd>Telescope neoclip<cr>')

-- execute
keymap('n', '<leader><leader>', '<cmd>Telescope commands<cr>')
keymap('n', '[execute]r',       '<cmd>Telescope command_history<cr>')
keymap('n', '[execute]s',       '<cmd>term<cr>')

-- file
keymap('n', '[file]f', '<cmd>lua require("telescope").extensions.file_browser.file_browser({ path = require("telescope.utils").buffer_dir(), depth = false, hidden = true, respect_gitignore = true })<cr>')
keymap('n', '[file]r', '<cmd>Telescope oldfiles<cr>')
keymap('n', '[file]s', '<cmd>w<cr>')

-- git
keymap('n', '[git]b', '<cmd>Telescope git_branches<cr>')
keymap('n', '[git]l', '<cmd>Telescope git_commits<cr>')
keymap('n', '[git]m', '<cmd>lua require("gitsigns").blame_line({ full = true })<cr>')
keymap('n', '[git]n', '<cmd>Gitsigns next_hunk<cr>zz')
keymap('n', '[git]p', '<cmd>Gitsigns prev_hunk<cr>zz')
keymap('n', '[git]s', '<cmd>Git<cr>')
keymap('n', '[git]v', '<cmd>Gitsigns preview_hunk<cr>')

-- lsp
keymap('n', 'K',      '<cmd>lua vim.lsp.buf.hover()<cr>')
keymap('n', '[lsp]F', '<cmd>lua vim.lsp.buf.formatting()<cr>')
keymap('n', '[lsp]R', '<cmd>lua vim.lsp.buf.rename()<cr>')
keymap('n', '[lsp]c', '<cmd>Telescope lsp_code_actions<cr>')
keymap('n', '[lsp]d', '<cmd>Telescope lsp_definitions<cr>')
keymap('n', '[lsp]h', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
keymap('n', '[lsp]i', '<cmd>Telescope lsp_implementations<cr>')
keymap('n', '[lsp]l', '<cmd>TroubleToggle workspace_diagnostics<cr>')
keymap('n', '[lsp]n', '<cmd>lua vim.diagnostic.goto_next()<cr>')
keymap('n', '[lsp]p', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
keymap('n', '[lsp]r', '<cmd>Telescope lsp_references<cr>')
keymap('n', '[lsp]s', '<cmd>Telescope lsp_workspace_symbols<cr>')
keymap('n', '[lsp]t', '<cmd>Telescope lsp_type_definitions<cr>')

-- project
keymap('n', '<leader>/',  '<cmd>Telescope live_grep<cr>')
keymap('n', '[project]f', '<cmd>Telescope git_files<cr>')
keymap('n', '[project]r', '<cmd>SearchSession<cr>')
keymap('n', '[project]s', '<cmd>SaveSession<cr>')

-- quit
keymap('n', '[quit]Q', '<cmd>qall!<cr>')
keymap('n', '[quit]q', '<cmd>wqall<cr>')

-- search
keymap('n', '[search]f', '<cmd>HopChar2<cr>')
keymap('n', '[search]l', '<cmd>HopLine<cr>')
keymap('n', '[search]r', '<cmd>Telescope search_history<cr>')
keymap('n', '[search]s', '<cmd>Telescope current_buffer_fuzzy_find<cr>')
keymap('n', '[search]w', '<cmd>HopWord<cr>')

-- window
keymap('n', '<c-w>/', '<cmd>vs<cr><c-w>l')
keymap('n', '<c-w>-', '<cmd>sp<cr><c-w>j')
keymap('n', '<c-w>r', '<cmd>WinResizerStartResize<cr>')
