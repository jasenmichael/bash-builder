#!/usr/bin/env bash

# ==================================================================================
# Script: inject_code.sh
# URL: https://github.com/jasenmichael/bash-builder/blob/main/src/lib/inject_code.sh
# !! Description: Injects code into files at specified markers
# !! Author: jasenmichael
# !! License: MIT License
#
# Functions:
# - inject_code: Replaces lines marked with "# bash_builder_inject" with specified code
# ==================================================================================
inject_code() {
  lines_to_inject=()
  # Read line by line from $DEST and store lines ending with "# bash_builder_inject"
  while IFS= read -r line; do
    if [[ "$line" =~ [[:space:]]*#[[:space:]]bash_builder_inject[[:space:]]*$ ]]; then
      clean_line="${line%\# bash_builder_inject*}"
      lines_to_inject+=("$line:::$clean_line")
    fi
  done <"$DEST"

  for line in "${lines_to_inject[@]}"; do
    search=${line%:::*}
    replace=$(eval "echo \"${line##*:::}\"")
    # !! echo "search: $search"
    # !! echo "replace: $replace"
    # !! eval "echo \"$replace\""
    # !! sed -i "s|^$search\$|$replace|" "$DEST"
    sed -i.bak "s|^$search\$|$replace|" "$DEST" && rm -f "$DEST.bak"
  done
}
