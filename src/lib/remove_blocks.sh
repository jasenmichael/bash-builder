#!/usr/bin/env bash

# ====================================================================================
# Script: remove_blocks.sh
# URL: https://github.com/jasenmichael/bash-builder/blob/main/src/lib/remove_blocks.sh
# !! Description: Removes specified code blocks from the script
# !! Author: jasenmichael
# !! License: MIT License
#
# Functions:
# - remove_blocks: Removes specified code blocks from the script
# ====================================================================================
# ## shellcheck disable=SC2120
remove_blocks() {
  local start_line=${1:-"bash_builder_remove_start"}
  local end_line=${2:-"bash_builder_remove_end"}
  sed -i -e "/# ${start_line}/,/# ${end_line}/d" "$DEST"
}
