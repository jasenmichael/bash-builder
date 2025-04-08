#!/usr/bin/env bash

# ======================================================================================
# Script: add_empty_lines.sh
# URL: https://github.com/jasenmichael/bash-builder/blob/main/src/lib/add_empty_lines.sh
# !! Description: Adds empty lines between code blocks to improve readability
# !! Author: jasenmichael
# !! License: MIT License
#
# Functions:
# - add_empty_lines: Adds empty lines after lines containing only "}"
# ======================================================================================
add_empty_lines() {
  # add empty line after lines containing only "}"
  # shellcheck disable=SC1003
  sed -i -e '/^[[:space:]]*}$/a\\' "$DEST"
}
