#!/usr/bin/env bash

# =================================================================
# Script: remove_lines_starting_with.sh
# URL: https://github.com/jasenmichael/bash-builder/src/lib/remove_lines_starting_with.sh
# !! Description: Removes lines starting with specified patterns, excluding function declarations
# !! Author: jasenmichael
# !! License: MIT License
#
# Functions:
# - remove_lines_starting_with: Removes lines starting with patterns from REMOVE_LINES_STARTING_WITH
# =================================================================
remove_lines_starting_with() {
  IFS=, read -ra patterns <<<"$REMOVE_LINES_STARTING_WITH"
  for pattern in "${patterns[@]}"; do
    sed -i "/() {/!{/^[[:space:]]*${pattern}/d}" "$DEST"
  done
}
