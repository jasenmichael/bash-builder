#!/usr/bin/env bash
# shellcheck disable=SC2034 # bash_builder_remove_line

DEBUG=${DEBUG:-false}
CLEAN=${CLEAN:-false}
COMMENTS=${COMMENTS:-false}
INLINE_COMMENTS=${INLINE_COMMENTS:-true}
REMOVE_LINES_STARTING_WITH=${REMOVE_LINES_STARTING_WITH:-}
BUILT_BY_BASH_BUILDER=${BUILT_BY_BASH_BUILDER:-true}
BUILT_BY_BASH_BUILDER_HEADER=$(
  cat <<EOF | sed 's/^  //'

  # Built with bash-builder v$VERSION
  # https://github.com/jasenmichael/bash-builder
  
EOF
)
