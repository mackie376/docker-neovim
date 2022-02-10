# docker-neovim

Docker コンテナ内で動作する [neovim](https://neovim.io) です。

## ベースイメージ

- node:16.13.2-bullseye-slim

## インストールされている主なツール類

- [neovim](https://neovim.io) (0.6.1)
- [zsh](https://www.zsh.org) (5.8)
- [starship](https://starship.rs) (1.3.1)
- [bat](https://github.com/sharkdp/bat) (0.19.0)
- [fd](https://github.com/sharkdp/fd) (8.3.2)
- [gh](https://github.com/cli/cli) (2.5.0)
- [prezto](https://github.com/sorin-ionescu/prezto)

## 使い方

### デフォルト値

- ユーザー : user
- グループ : user
- パスワード : password
- ユーザーID : 1000
- グループID : 1000

### とりあえず使う

このリポジトリを、クローンしてビルドしてください。また、同じものを docker hub にも push してあるのでそっちから pull してもらってもいいかと思います。
コンテナが起動すると zsh がプロンプトを表示するので、nvim コマンドで neovim を起動してください。

```sh
## clone & build
cd docker-neovim
docker build -t neovim:latest .

## pull from docker hub
docker pull mackie376/neovim:0.6.1

## run container
docker run -it --rm --name neovim neovim:latest

## in container
nvim
```

### デフォルト値を変更して使いたい

クローンしてビルドする際に、変数を定義することでデフォルト値を変更することが出来ます。
また、docker hub から pull した場合は、デフォルト値でビルドされたイメージになります。

```sh
## default value
##   USER=user
##   GROUP=user
##   PASS=password
##   UID=1000
##   GID=1000

docker build --build-arg USER=mackie GROUP=mackie PASS=12345 UID=9990 GID=990 -t neovim:0.6.1
```

### neovim の設定を独自のものに変更したい

neovim の設定は ```${HOME}/.config/nvim``` にあります。ホストのディレクトリをここにマウントして変更してください。

```sh
docker run -it --rm --name neovim -v "${PWD}/conf.d/neovim:/home/user/.config/nvim" neovim:0.6.1
```

### シェルの拡張

このコンテナは、プロンプトを表示する前に ```${HOME}/user-config.zsh``` が存在すればそれを source するように記述しています。
もしも zsh 自体の拡張が必要な場合、このファイルをマウントすればそれが実現できるかもしれません。

```sh
git run -it --name neovim -v "${PWD}/user-config.zsh:/home/user/user-config.zsh" neovim:0.6.1
```

## 使用している neovim のプラグイン

### パッケージマネージャ

- [packer](https://github.com/wbthomason/packer.nvim)

### 見た目

- [nightfox](https://github.com/EdenEast/nightfox.nvim)
- [lualine](https://github.com/nvim-lualine/lualine.nvim)

### 基本編集

- [nvim-web-devicons](https://github.com/nvim-telescope/telescope.nvim)
- [plenary](https://github.com/nvim-telescope/telescope.nvim)

- [vim-commentary](https://github.com/tpope/vim-commentary)
- [vim-surround](https://github.com/tpope/vim-surround)
- [vim-sandwich](https://github.com/machakann/vim-sandwich)
- [winresizer](https://github.com/simeji/winresizer)
- [editorconfig-vim](https://github.com/editorconfig/editorconfig-vim)
- [lexima.vim](https://github.com/cohama/lexima.vim)

### 移動 / 検索

- [hop](https://github.com/phaazon/hop.nvim)
- [vim-bookmarks](https://github.com/MattesGroeger/vim-bookmarks)

### シンタックスハイライト

- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

### Git 制御

- [fugitive](https://github.com/tpope/vim-fugitive)
- [gitsigns](https://github.com/lewis6991/gitsigns.nvim)

### ツール起動

- [toggleterm](https://github.com/akinsho/toggleterm.nvim)

### 自動入力補完 / スニペット

- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
- [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
- [cmp-path](https:/github.com/hrsh7th/cmp-path)
- [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)
- [lspkind-nvim](https://github.com/onsails/lspkind-nvim)
- [vim-vsnip](https://github.com/hrsh7th/vim-vsnip)
- [vim-vsnip-integ](https://github.com/hrsh7th/vim-vsnip-integ)
- [cmp-vsnip](https://github.com/hrsh7th/cmp-vsnip)

### LSP

- [nvim-lsp-installer](https://github.com/williamboman/nvim-lsp-installer)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)

### Telescope

- [telescope](https://github.com/nvim-telescope/telescope.nvim)
- [nvim-neoclip](https://github.com/AckslD/nvim-neoclip.lua)
- [telescope-vim-bookmarks](https://github.com/tom-anders/telescope-vim-bookmarks)
- [telescope-file-browser](https://github.com/nvim-telescope/telescope-file-browser.nvim)
- [telescope-packer](https://github.com/nvim-telescope/telescope-packer.nvim)
- [telescope-fzf-native](https://github.com/nvim-telescope/telescope-file-browser.nvim)
