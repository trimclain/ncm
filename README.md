# Neovim Config Manager

Run neovim using a different config without breaking your own.

## Requirements

-   nvim-0.9.0
-   `~/.local/bin/` should be in `$PATH`

## Installation

```
bash <(curl -s https://raw.githubusercontent.com/trimclain/ncm/main/install.sh)
```

## How to use

-   Run `ncm help` to see the help menu
-   Use `ncm add [configname]` to add a config folder to ncm. The folder needs to be either in `$(pwd)` or in `~/.config/`
-   Use `ncm use [configname]` to launch neovim with chosen config. Or use `ncm` to choose a config from the list
-   Use `ncm del [configname]` to delete an existing config from the list and from the system
-   Use `ncm update` to update ncm
-   Use `ncm update all` to update ncm and installed configs, that are a git repository

## Demo

https://user-images.githubusercontent.com/84108846/230238465-014f99d5-7c6e-4c00-a691-f4f870b83865.mp4

## Uninstall

```
bash <(curl -s https://raw.githubusercontent.com/trimclain/ncm/main/uninstall.sh)
```

## Inspiration
Great video by Elijah Manor - [link](https://www.youtube.com/watch?v=LkHjJlSgKZY)
