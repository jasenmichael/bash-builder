#!/usr/bin/env bash

# =================================================================
# Script: inject_sourced_contents.sh
# URL: https://github.com/jasenmichael/bash-builder/src/lib/inject_sourced_contents.sh
# !! Description: Injects contents of sourced files into the main script
# !! Author: jasenmichael
# !! License: MIT License
#
# Functions:
# - inject_sourced_contents: Injects contents of sourced files into the main script
# =================================================================
inject_sourced_contents() {
  while IFS= read -r line; do
    if [[ "$line" =~ ^source\ .* ]]; then
      # ## Check if line ends with exactly "# bash_builder_skip_inject"
      if [[ "$line" =~ [[:space:]]*#[[:space:]]bash_builder_skip_inject$ ]]; then
        # ## remove inline comment and add to dest
        echo "${line%#*}" >>"$DEST"
        continue
      fi

      log_debug "line: $line"
      sourced_file="${line#source }"
      # ## remove inline comment from line
      sourced_file="${sourced_file%#*}"
      # ## remove whitespace
      sourced_file="${sourced_file%%[[:space:]]*}"
      # ## remove quotes from around sourced_file
      sourced_file="${sourced_file#\"}"
      sourced_file="${sourced_file%\"}"

      sourced_contents=$(cat "$sourced_file" || {
        log_error "failed to read sourced file: $sourced_file"
        exit 1
      })

      # ## remove the shebang(the first line if starts with #!/) from sourced_contents
      sourced_contents=$(echo "$sourced_contents" | sed '1s/^#!.*//')

      if [[ "$sourced_file" != *"inject_sourced_contents.sh" ]]; then
        # ## remove all lines after the line containing "bash_builder_remove_after"
        # except for this section when bash_builder is building itself!!!!!
        sourced_contents=$(echo "$sourced_contents" | sed '/# bash_builder_remove_after/,$d')
      fi

      log_debug "injecting $sourced_file"
      echo "$sourced_contents" >>"$DEST"
    else
      echo "$line" >>"$DEST"
    fi

  done <"$SRC"
}
