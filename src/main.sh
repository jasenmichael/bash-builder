#!/usr/bin/env bash
# shellcheck disable=SC1091,SC2034 # bash_builder_remove_line

# bash_builder_remove_start
START_DIR=$PWD
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd "$SCRIPT_DIR/.." || exit
echo -e "\033[1;33m[bash-builder]\033[0m START_DIR: $START_DIR"
echo -e "\033[1;33m[bash-builder]\033[0m SCRIPT_DIR: $SCRIPT_DIR"
echo -e "\033[1;33m[bash-builder]\033[0m PWD: $PWD"
# bash_builder_remove_end

VERSION="$(cat VERSION)" # bash_builder_inject

# !! source libs
source "./src/lib/usage.sh"
source "./src/lib/parse_args.sh"
source ".dependencies/bash-utils/bash-log.sh"
source "./src/defaults.sh"
source "./src/lib/validate.sh"
source "./src/lib/create_dest_dir.sh"
source "./src/lib/inject_sourced_contents.sh"
source "./src/lib/inject_code.sh"
source "./src/lib/remove_blocks.sh"
source "./src/lib/remove_comments.sh"
source "./src/lib/add_empty_lines.sh"
source "./src/lib/remove_lines_starting_with.sh"
source "./src/lib/remove_line.sh"
source "./src/lib/remove_duplicate_empty_lines.sh"
source "./src/lib/inject_heading.sh"
source ".dependencies/bash-utils/bash-format.sh"

run_bash_builder() {
  # bash_builder_remove_start
  cd "$START_DIR" || exit
  # bash_builder_remove_end
  parse_args "$@" # sets: SRC, DEST, and options
  validate

  log_info "Building $SRC to $DEST"

  create_dest_dir
  rm -f "$DEST" >/dev/null 2>&1
  inject_sourced_contents
  remove_blocks
  inject_code
  remove_comments
  add_empty_lines
  remove_lines_starting_with
  inject_heading
  remove_line
  remove_duplicate_empty_lines

  log_info "$(format "$DEST")"

  chmod +x "$DEST"

  log_info "🎉 Build complete: $DEST\n"
}

if ! (return &>/dev/null); then
  run_bash_builder "$@"
  # bash_builder_remove_start
  log_debug "DEBUG:    $DEBUG"
  log_debug "CLEAN:    $CLEAN"
  log_debug "COMMENTS: $COMMENTS"
  log_debug "INLINE_COMMENTS: $INLINE_COMMENTS"
  log_debug "REMOVE_LINES_STARTING_WITH: $REMOVE_LINES_STARTING_WITH"
  log_debug "BUILT_BY_BASH_BUILDER: $BUILT_BY_BASH_BUILDER"
  # bash_builder_remove_end
else
  echo "bash-builder should not be sourced"
  exit 1
fi
