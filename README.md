# AstroNvim personal config

**NOTE:** This is for AstroNvim v5+

A template for getting started with [AstroNvim](https://github.com/AstroNvim/AstroNvim)

Support：ESP-IDF , verilog


## 🛠️ Installation

#### Ubuntu

If you're on Ubuntu, it's best to install Neovim via Snap. The 0.12.x unstable version can cause some errors with astronlsp.

```shell
sudo snap install nvim --classic
```

#### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

#### Create a new user repository from this template

Press the "Use this template" button above to create a new repository to store your user configuration.

You can also just clone this repository directly if you do not want to track your user configuration in GitHub.

#### Clone the repository

```shell
git clone https://github.com/pansyhou/astronvim_config ~/.config/nvim
```

#### Start Neovim

```shell
nvim
```
