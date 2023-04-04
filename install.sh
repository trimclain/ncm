#!/usr/bin/env bash

main() {
    # Colors
    local BLUE="\033[1;34m"
    local GREEN="\033[1;32m"
    local RED="\e[1;31m"
    local RESET="\033[0m"

    local NCM_DIR="$HOME/.local/share/ncm"
    local LOCAL_BIN=~/.local/bin/

    # don't allow any arguments for now
    if [[ -n $1 ]]; then
        echo -e "${RED}Error: unknown argument \"$1\"${RESET}"
        return 1
    fi

    # check if NCM_DIR already exists
    if [[ -d "$NCM_DIR" ]]; then
        echo -e "${GREEN}NCM is already installed in \"$NCM_DIR\"!${RESET}"
        read -n1 -rp "Reinstall NCM? [y/N] " res
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

    git clone -b https://github.com/trimclain/ncm.git "$NCM_DIR" > /dev/null 2>&1

    # Symlink ncm to ~/.local/bin/, check if it's in $PATH
    if [[ ! :$PATH: == *":$LOCAL_BIN:"* ]]; then
        echo -e "${RED}Error: $LOCAL_BIN not in \$PATH${RESET}"
        return 1
    fi
    rm -f "$LOCAL_BIN/ncm"
    ln -s "$NCM_DIR/ncm" "$LOCAL_BIN/ncm"

    echo -e "${GREEN}Done${RESET}"
    return 0
}

main "$@"
