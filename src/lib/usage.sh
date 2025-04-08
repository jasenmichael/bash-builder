#!/usr/bin/env bash

# ======================================================================
# Script: usage.sh
# URL: https://github.com/jasenmichael/bash-builder/src/lib/usage.sh
# !! Description: Prints usage information for the script
# !! Author: jasenmichael
# !! License: MIT License
#
# Functions:
# - usage: Prints usage information and exits with specified status code
# ======================================================================
USAGE="Usage:
  bash_builder <src> <dest> [options]

  --comments             keep comments, default is false
  --no-inline-comments   remove inline comments, default is false
  --clean                empty build directory
  --debug                enable debug output

  Options can also be set via environment variables:
    DEBUG=true | false
    CLEAN=true | false
    COMMENTS=true  | false
    INLINE_COMMENTS=true | false
"
usage() {
  local exit_code=${1:-0}
  echo -e "$USAGE"
  exit "$exit_code"
}
