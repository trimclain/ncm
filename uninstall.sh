#!/usr/bin/env bash

main() {
    # Colors
    local BLUE="\033[1;34m"
    local GREEN="\033[1;32m"
    local RED="\e[1;31m"
    local RESET="\033[0m"

    local NCM_DIR="$HOME/.local/share/ncm"
    local LOCAL_BIN="$HOME/.local/bin/"

    # don't allow any arguments for now
    if [[ -n $1 ]]; then
        echo -e "${RED}Error: unknown argument \"$1\"${RESET}"
        return 1
    fi

    if [[ ! -d "$NCM_DIR" ]]; then
        echo -e "${GREEN}NCM not found!${RESET}"
        return 1
    fi

    read -n1 -rp "Uninstall NCM? [y/N] " res
    echo ""
    if [[ $res == "n" ]] || [[ $res == "N" ]]; then
        echo -e "${GREEN}Canceled!${RESET}"
        return 0
    fi
    echo -n -e "${BLUE}Uninstalling NCM... ${RESET}"

    rm -rf "$NCM_DIR"
    # Uninstall the symlink
    rm -f "$LOCAL_BIN/ncm"

    echo -e "${GREEN}Done${RESET}"
    return 0
}

main "$@"
