#!/usr/bin/env bash

# =================================================================
# Script: create_dest_dir.sh
# URL: https://github.com/jasenmichael/bash-builder/src/lib/create_dest_dir.sh
# !! Description: Creates destination directory if it doesn't exist
# !! Author: jasenmichael
# !! License: MIT License
#
# Functions:
# - create_dest_dir: Creates destination directory if it doesn't exist
# =================================================================
create_dest_dir() {
  # !! create destination directory if it does not exist
  if [ ! -d "$(dirname "$DEST")" ]; then
    log_info "$(dirname "$DEST") dir does not exist, creating"
    mkdir -p "$(dirname "$DEST")"
  elif [ "$CLEAN" = true ]; then
    log_info "emptying $(dirname "$DEST") dir"
    rm -rf "$(dirname "$DEST")"
    mkdir -p "$(dirname "$DEST")"
  fi
}
