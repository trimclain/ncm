# Neovim Config Manager

Run Neovim using a different config without modifying your own.

## Requirements

- [Neovim v0.9.0](https://github.com/neovim/neovim/releases/tag/v0.9.0) or later
- [fzf](https://github.com/junegunn/fzf)
- `~/.local/bin/` should be in `$PATH`

## Installation

```
curl -fsSL https://raw.githubusercontent.com/trimclain/ncm/main/install.sh | bash
```

## Usage

```
ncm [OPTION]
```

There are several option available with NCM:

| Option                                           | Description                                                         |
| ------------------------------------------------ | ------------------------------------------------------------------- |
| `h, help, --help`                                | Show the help message                                               |
| `a, add <config>`                                | Add a config directory to NCM                                       |
| `u, use`                                         | Choose a config to launch neovim with                               |
| `u, use [config]`                                | Launch neovim with given config name                                |
| `d, del, rm <config>`                            | Delete a config from NCM and delete all it's traces from the system |
| `l, list, ls`                                    | List installed configs                                              |
| `update`                                         | Update NCM                                                          |
| `update all`                                     | Update NCM and all installed configs (only git repos with remote)   |
| `version, -V`                                    | Print the current version of NCM                                    |


## Popular Configs

- AstroNvim
```
git clone --depth=1 https://github.com/AstroNvim/AstroNvim ~/.config/AstroNvim && ncm add AstroNvim
```
- CosmicNvim
```
git clone --depth=1 https://github.com/CosmicNvim/CosmicNvim ~/.config/CosmicNvim && ncm add CosmicNvim
```
- LazyVim
```
git clone --depth=1 https://github.com/LazyVim/starter ~/.config/LazyVim && ncm add LazyVim
```
- NvChad
```
git clone --depth=1 https://github.com/NvChad/NvChad ~/.config/NvChad && ncm add NvChad
```

- Space Vim
```
git clone --depth=1 https://github.com/SpaceVim/SpaceVim ~/.config/SpaceVim && ncm add SpaceVim
```


## Demo

https://user-images.githubusercontent.com/84108846/230238465-014f99d5-7c6e-4c00-a691-f4f870b83865.mp4


## Uninstall

```
curl -fsSL https://raw.githubusercontent.com/trimclain/ncm/main/uninstall.sh | bash
```

## Credit

Thanks to a great [video](https://www.youtube.com/watch?v=LkHjJlSgKZY) by Elijah Manor for the inspiration.
