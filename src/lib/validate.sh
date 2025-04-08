#!/usr/bin/env bash

# ================================================================================
# Script: validate.sh
# URL: https://github.com/jasenmichael/bash-builder/blob/main/src/lib/validate.sh
# !! Description: Validates source and destination paths before processing
# !! Author: jasenmichael
# !! License: MIT License
#
# Functions:
# - validate: Validates that source file exists and destination is not a directory
# ================================================================================
validate() {
  if [ ! -f "$SRC" ]; then
    log_error "src file does not exist: $SRC"
    usage 1
  fi

  if [ -d "$DEST" ]; then
    log_error "$DEST is an existing directory, dest must be the path to the output file."
    usage 1
  fi
}
