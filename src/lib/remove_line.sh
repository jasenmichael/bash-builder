#!/usr/bin/env bash

# ==================================================================================
# Script: remove_line.sh
# URL: https://github.com/jasenmichael/bash-builder/blob/main/src/lib/remove_line.sh
# !! Description: Removes lines marked for removal during build process
# !! Author: jasenmichael
# !! License: MIT License
#
# Functions:
# - remove_line: Removes lines containing "bash_builder_remove_line" marker
# ==================================================================================
remove_line() {
  # ## hack add \ to not remove this line when building self
  sed -i '/bash\_builder_remove_line/d' "$DEST"
}
