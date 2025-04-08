#!/usr/bin/env bash

# =====================================================================================
# Script: inject_heading.sh
# URL: https://github.com/jasenmichael/bash-builder/blob/main/src/lib/inject_heading.sh
# !! Description: Injects a header into files if built by bash-builder
# !! Author: jasenmichael
# !! License: MIT License
#
# Functions:
# - inject_heading: Injects a header into the file if BUILT_BY_BASH_BUILDER is true
# =====================================================================================
inject_heading() {
  if [ "$BUILT_BY_BASH_BUILDER" = true ]; then
    printf '%s\n' "$BUILT_BY_BASH_BUILDER_HEADER" | sed -i '1r /dev/stdin' "$DEST"
  fi
}
