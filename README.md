# docker-neovim

Docker image for Neovim.

## Versions

- Neovim (nightly)
- Node.js (14.17.0)

## Vim plugin

- [dein.nvim](https://github.com/Shougo/dein.vim)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [nerdtree](https://github.com/preservim/nerdtree)
- [vim-fugitive](https://github.com/tpope/vim-fugitive)
- [vim-gitgutter](https://github.com/airblade/vim-gitgutter)
- [nvim-toggleterm.lua](https://github.com/akinsho/nvim-toggleterm.lua)
- [vim-easymotion](https://github.com/gantheory/vim-easymotion)
- [vim-surround](https://github.com/tpope/vim-surround)
- [lexima.vim](https://github.com/cohama/lexima.vim)
- [nerdcommenter](https://github.com/preservim/nerdcommenter)
- [vim-bookmarks](https://github.com/MattesGroeger/vim-bookmarks)
- [vim-closetag](https://github.com/alvan/vim-closetag)
- [context_filetype.vim](https://github.com/Shougo/context_filetype.vim)
- [vim-precious](https://github.com/osyo-manga/vim-precious)
- [Dockerfile.vim](https://github.com/ekalinin/Dockerfile.vim)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [iceberg.vim](https://github.com/cocopon/iceberg.vim)
- [lualine.nvim](https://github.com/hoob3rt/lualine.nvim)
- [vim-vsnip](https://github.com/hrsh7th/vim-vsnip)
- [nvim-compe](https://github.com/hrsh7th/nvim-compe)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)

## How to build

```sh
# default value
#   USER:  user
#   GROUP: user
#   UID:   1000
#   GID:   1000
#   PASS:  password

# get repository
git clone https://github.com/mackie376/docker-neovim.git <path-to-repos>
cd <path-to-repos>

# build
docker build --build-args USER=<user> --build-arg GROUP=<group> -t neovim:latest .
```

## How to run

```sh
# run container
docker run -it --rm --name neovim neovim:latest

# run neovim (in container)
nvim
```
