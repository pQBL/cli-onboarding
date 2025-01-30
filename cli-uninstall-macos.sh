#!/bin/bash

#
# This script UNINSTALLS the pqbl cli on macOS.
#

YELLOW="\033[33m"
RESET="\033[0m"

CLI_NAME="pqbl"

echo -e "${YELLOW}$CLI_NAME: uninstalling cli...${RESET}"
npm uninstall -g "$CLI_NAME"

echo -e "${YELLOW}$CLI_NAME: cli is now uninstalled${RESET}"
echo -e "${YELLOW}$CLI_NAME: run 'pqbl --version' to ensure that no executable is remaining${RESET}"
