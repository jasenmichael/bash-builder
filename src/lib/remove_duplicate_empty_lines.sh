#!/usr/bin/env bash

# =================================================================
# Script: remove_duplicate_empty_lines.sh
# URL: https://github.com/jasenmichael/bash-builder/src/lib/remove_duplicate_empty_lines.sh
# !! Description: Removes duplicate empty lines from the script
# !! Author: jasenmichael
# !! License: MIT License
#
# Functions:
# - remove_duplicate_empty_lines: Removes duplicate empty lines from the script
# =================================================================
remove_duplicate_empty_lines() {
  sed -i ':a;N;$!ba;s/\n\n\+/\n\n/g' "$DEST"
}
