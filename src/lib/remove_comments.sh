#!/usr/bin/env bash

# ================================================================================================
# Script: remove_comments.sh
# URL: https://github.com/jasenmichael/bash-builder/blob/main/src/lib/remove_comments.sh
# !! Description: Removes comments from $DEST
# !! Author: jasenmichael
# !! License: MIT License
#
# Functions:
# - remove_comments: Removes comments from the script with special handling for ## and !! comments
# ================================================================================================
remove_comments() {
  # ## un-comment lines (remove  "# %% " from beginning of lines that start with "# %% ")
  sed -i -E 's/^#[[:space:]]*%{2}[[:space:]]+//' "$DEST"

  # ## remove all comments except shebang that do not start with "# ##"
  if [ "$COMMENTS" = false ]; then
    sed -i -E '/^#!/b; /^[[:space:]]*#[[:space:]]*##/!{ /^[[:space:]]*#/d }' "$DEST"
    # sed -i -E '/^#!/b; /^[[:space:]]#[[:space:]]##/!{ /^[[:space:]]#/d }' "$DEST"
    if [ "$INLINE_COMMENTS" = false ]; then
      # ## remove inline comments that do not start with "# ##"
      sed -i -E '/[[:blank:]]#[[:blank:]]+##/! s/[[:blank:]]+#[[:blank:]].*//' "$DEST"
    fi
    # ## remove all inline comments that start with "# !!"
    sed -i -E 's/[[:blank:]]+#[[:blank:]]+!!.*//' "$DEST"
  fi
  # ## always remove all other shebangs from injected sourced files
  sed -i '1!{/^[[:space:]]*#!/d}' "$DEST" # inline comment
  # ## replace lines starting with "# ##" with "#", normalizing the kept comments
  sed -i 's/^[[:space:]]*#[[:space:]]##\s*/# /' "$DEST"
  # ## always remove entire lines that start with "# !!"
  sed -i '/^[[:space:]]*#\s*!!\s*/d' "$DEST"
}
