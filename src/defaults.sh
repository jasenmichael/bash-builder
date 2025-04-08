#!/usr/bin/env bash
# shellcheck disable=SC2034

DEBUG=${DEBUG:-false}
CLEAN=${CLEAN:-false}
COMMENTS=${COMMENTS:-false}
INLINE_COMMENTS=${INLINE_COMMENTS:-true}
REMOVE_LINES_STARTING_WITH=${REMOVE_LINES_STARTING_WITH:-}
THIS_WAS_BUILT_BY_BASH_BUILDER_HEADER=${THIS_WAS_BUILT_BY_BASH_BUILDER_HEADER:-true}
BUILT_BY_BASH_BUILDER_HEADER=$(
  cat <<EOF | sed 's/^  //'

  # Built with bash-builder v$VERSION
  # https://github.com/jasenmichael/bash-builder
  
EOF
)
