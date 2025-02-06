#!/bin/bash

#
# This script UNINSTALLS the pqbl cli on macOS.
#

CLI_NAME="pqbl"

YELLOW="\033[33m"
GREEN="\033[32m"
RED="\033[31m"
RESET="\033[0m"

error_exit() {
    echo -e "${RED}$CLI_NAME: ERROR - $1${RESET}" >&2
    exit 1
}

echo -e "${YELLOW}$CLI_NAME: uninstalling cli...${RESET}"
npm uninstall -g "$CLI_NAME" || error_exit "Failed to uninstall CLI"

echo -e "${GREEN}$CLI_NAME: CLI is now uninstalled${RESET}"
echo -e "${GREEN}$CLI_NAME: run '$CLI_NAME --version' to ensure no executable remains${RESET}"
