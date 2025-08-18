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
| `v, version, -v`                                 | Print the current version of NCM                                    |
| `a, add <config>`                                | Add a config directory to NCM                                       |
| `a, add <url>`                                   | Clone a config repository and add it to NCM                       |
| `u, use`                                         | Choose a config to launch neovim with                               |
| `u, use [config]`                                | Launch neovim with given config name                                |
| `d, del, rm <config>`                            | Delete a config from NCM and delete all it's traces from the system |
| `l, list, ls`                                    | List installed configs                                              |
| `update`                                         | Update all installed configs (only git repos with remote)           |
| `uninstall`                                      | Remove all installed configs                                        |


## Popular Configs

- LazyVim
```
ncm add https://github.com/LazyVim/starter
```
- NvChad
```
ncm add https://github.com/NvChad/starter
```
- AstroNvim
```
ncm add https://github.com/AstroNvim/template
```
- CosmicNvim
```
ncm add https://github.com/CosmicNvim/CosmicNvim
```


## Demo

https://user-images.githubusercontent.com/84108846/230238465-014f99d5-7c6e-4c00-a691-f4f870b83865.mp4

## How to uninstall

1. Uninstall all configs
```
ncm uninstall
```
2. Remove ncm
```
rm -rf ~/.local/bin/ncm ~/.local/share/ncm
```

## Credit

Thanks to a great [video](https://www.youtube.com/watch?v=LkHjJlSgKZY) by Elijah Manor for the inspiration.
