#!/bin/bash

#
# This script INSTALLS the pqbl cli on macOS.
#

DIRNAME="pqbl_ts"
REPO="git@github.com:eeegl/$DIRNAME.git"
BRANCH="dev"

CLI_NAME="pqbl"

YELLOW="\033[33m"
GREEN="\033[32m"
RED="\033[31m"
RESET="\033[0m"

error_exit() {
    echo -e "${RED}$CLI_NAME: ERROR - $1${RESET}" >&2
    exit 1
}

echo -e "${YELLOW}$CLI_NAME: cloning branch '$BRANCH' from $REPO${RESET}"
git clone -b "$BRANCH" "$REPO" || error_exit "Failed to clone repository"

# temporarily change directory
pushd "$DIRNAME" > /dev/null || error_exit "Failed to enter directory $DIRNAME"

echo -e "${YELLOW}$CLI_NAME: installing dependencies...${RESET}"
npm install || error_exit "Dependency installation failed"

echo -e "${YELLOW}$CLI_NAME: building cli...${RESET}"
npm run build || error_exit "Build failed"

echo -e "${YELLOW}$CLI_NAME: giving cli execute permissions...${RESET}"
chmod +x dist/src/main.js || error_exit "Failed to set execute permissions"

echo -e "${YELLOW}$CLI_NAME: installing cli globally...${RESET}"
sudo npm install -g . || error_exit "Global installation failed"

# change back to original directory
popd > /dev/null || error_exit "Failed to return to original directory"

echo -e "${GREEN}$CLI_NAME: installation complete${RESET}"
echo -e "${GREEN}$CLI_NAME: run '$CLI_NAME --version' to ensure everything works${RESET}"
