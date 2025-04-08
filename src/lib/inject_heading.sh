#!/usr/bin/env bash

# =================================================================
# Script: inject_heading.sh
# URL: https://github.com/jasenmichael/bash-builder/src/lib/inject_heading.sh
# !! Description: Injects a header into files if built by bash-builder
# !! Author: jasenmichael
# !! License: MIT License
#
# Functions:
# - inject_heading: Injects a header into the file if THIS_WAS_BUILT_BY_BASH_BUILDER_HEADER is true
# =================================================================
inject_heading() {
  if [ "$THIS_WAS_BUILT_BY_BASH_BUILDER_HEADER" = true ]; then
    printf '%s\n' "$BUILT_BY_BASH_BUILDER_HEADER" | sed -i '1r /dev/stdin' "$DEST"
  fi
}
