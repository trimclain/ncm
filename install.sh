#!/usr/bin/env bash

main() {
    # Colors
    local BLUE="\033[1;34m"
    local GREEN="\033[1;32m"
    local RED="\e[1;31m"
    local RESET="\033[0m"

    local NCM_DIR="$HOME/.local/share/ncm"
    # TODO: allow to pass in a custom directory (in $PATH)
    # since this will be used by uninstall.sh, it should be a exported global
    # variable in the SHELL config
    local LOCAL_BIN="$HOME/.local/bin/"

    # don't allow any arguments for now
    if [[ -n $1 ]]; then
        echo -e "${RED}Error: unknown argument \"$1\"${RESET}"
        return 1
    fi

    # check if NCM_DIR already exists
    if [[ -d "$NCM_DIR" ]]; then
        echo "NCM is already installed in \"$NCM_DIR\"!"
        read -n1 -rp "Do you want to reinstall? [y/N] " res
        echo ""
        if [[ $res == "n" ]] || [[ $res == "N" ]]; then
            echo -e "${GREEN}Skipped!${RESET}"
            return 0
        fi
        echo -n -e "${BLUE}Reinstalling NCM... ${RESET}"
        rm -rf "$NCM_DIR"
    else
        echo -n -e "${BLUE}Installing NCM... ${RESET}"
    fi

    git clone https://github.com/trimclain/ncm.git "$NCM_DIR" > /dev/null 2>&1

    rm -f "$LOCAL_BIN/ncm"
    # Symlink ncm to ~/.local/bin/
    ln -s "$NCM_DIR/ncm" "$LOCAL_BIN/ncm"

    echo -e "${GREEN}Done${RESET}"
}

main "$@"
