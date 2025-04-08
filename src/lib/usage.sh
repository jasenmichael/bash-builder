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
USAGE=$(
  cat <<EOF | sed 's/^  //'
  Usage:
    ${0##*/} -h | --help | help        # Show usage information and exit
    ${0##*/} -V | --version | version  # Show version information and exit
    ${0##*/} <src> <dest> [options]
  
  Options:
    --debug                       Enable debug mode
    --clean                       Clean mode, sets CLEAN=true
    --comments                    Do not strip comments, sets COMMENTS=true
    --no-inline-comments          Disable inline comments, sets NO_INLINE_COMMENTS=false
    --no-built-by-bash-builder    Disable BUILT_BY_BASH_BUILDER_HEADER injection
    --remove-lines-starting-with  Remove lines starting with specified pattern(can be used multiple times)
                                  Example: 
                                    ${0##*/} \$SRC \$DEST \ \r
                                      --remove-lines-starting-with log_debug \ \r
                                      --remove-lines-starting-with remove_me
  
  Options with environment variables:
    DEBUG=true|false                 (default false)
    CLEAN=true|false                 (default false)
    COMMENTS=true|false              (default false)
    INLINE_COMMENTS=true|false       (default true)
    BUILT_BY_BASH_BUILDER=true|false (default true)
EOF
)
usage() {
  local exit_code=${1:-0}
  echo -e "$USAGE"
  exit "$exit_code"
}
