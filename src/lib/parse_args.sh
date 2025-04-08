#!/usr/bin/env bash

# =================================================================================
# Script: parse_args.sh
# URL: https://github.com/jasenmichael/bash-builder/blob/main/src/lib/parse_args.sh
# !! Description: Parses command line arguments for the script
# !! Author: jasenmichael
# !! License: MIT License
#
# Functions:
# - parse_args: Parses command line arguments and sets global variables
# =================================================================================
parse_args() {
  # shellcheck disable=SC2034
  while test $# != 0; do
    case "$1" in
    -h | --help | help)
      usage 0
      ;;
    -V | --version | version)
      echo "$VERSION"
      exit 0
      ;;
    --debug) DEBUG=true ;;
    --clean) CLEAN=true ;;
    --comments) COMMENTS=true ;;
    --no-inline-comments) INLINE_COMMENTS=false ;;
    --no-built-by-bash-builder)
      BUILT_BY_BASH_BUILDER=false
      ;;
    --remove-lines-starting-with)
      shift
      if [ -z "$REMOVE_LINES_STARTING_WITH" ]; then
        REMOVE_LINES_STARTING_WITH="$1"
      else
        REMOVE_LINES_STARTING_WITH="$REMOVE_LINES_STARTING_WITH $1"
      fi
      ;;
    *)
      if [[ ! "$1" =~ ^-.* ]]; then
        if [ -z "$SRC" ]; then
          SRC="$1"
        elif [ -n "$SRC" ] && [ -z "$DEST" ]; then
          DEST="$1"
        else
          log_error "too many arguments $1"
          usage 1
        fi
      else
        log_error "unknown option: $1"
        usage 1
      fi
      ;;
    esac
    shift
  done

  if [ -z "$SRC" ]; then
    log_error "missing src and dest"
    usage 1
  elif [ -z "$DEST" ]; then
    log_error "missing dest"
    usage 1
  fi
}
