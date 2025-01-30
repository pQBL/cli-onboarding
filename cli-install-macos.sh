#!/bin/bash

#
# This script INSTALLS the pqbl cli on macOS.
#

DIRNAME="pqbl_ts"
REPO="git@github.com:eeegl/$DIRNAME.git"
BRANCH="dev"

CLI_NAME="pqbl"

YELLOW="\033[33m"
RESET="\033[0m"

echo -e "${YELLOW}$CLI_NAME: cloning branch '$BRANCH' from $REPO${RESET}"
git clone -b "$BRANCH" "$REPO"

# temporarily change directory
pushd "$DIRNAME" > /dev/null # suppress output

echo -e "${YELLOW}$CLI_NAME: installing dependencies...${RESET}"
npm install

echo -e "${YELLOW}$CLI_NAME: building cli...${RESET}"
npm run build

echo -e "${YELLOW}$CLI_NAME: giving cli execute permissions...${RESET}"
chmod +x dist/src/main.js

echo -e "${YELLOW}$CLI_NAME: installing cli globally...${RESET}"
npm install -g .

# change back to original directory
popd > /dev/null # suppress output

echo -e "${YELLOW}$CLI_NAME: installation complete${RESET}"
echo -e "${YELLOW}$CLI_NAME: run '$CLI_NAME --version' to ensure everything works${RESET}"

