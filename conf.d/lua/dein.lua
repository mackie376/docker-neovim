local dein_dir = vim.fn.stdpath('data')..'/dein'
local dein_repos_dir = dein_dir..'/repos/github.com/Shougo/dein.vim'

if not string.find(vim.api.nvim_get_option('runtimepath'), '/dein.nvim') then
  if vim.fn.isdirectory(dein_repos_dir) == 0 then
    os.execute('git clone https://github.com/Shougo/dein.vim '..dein_repos_dir)
  end
  vim.api.nvim_set_option('runtimepath', dein_repos_dir..','..vim.api.nvim_get_option('runtimepath'))
end

if vim.fn['dein#load_state'](dein_dir) == 1 then
  vim.fn['dein#begin'](dein_dir)
  vim.fn['dein#load_toml'](vim.fn.stdpath('config')..'/plugins.toml', { lazy = 1 })
  vim.fn['dein#end']()
  vim.fn['dein#save_state']()
end

if vim.fn['dein#check_install']() ~= 0 then
  vim.fn['dein#install']()
end

local removed_plugins = vim.fn['dein#check_clean']()
if vim.fn.len(removed_plugins) > 0 then
  vim.fn.map(removed_plugins, "delete(v:val, 'rf')")
  vim.fn['dein#recache_runtimepath']()
end
