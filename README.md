# bash-builder

A tool for building/transpiling bash scripts.

## Features

- Optional sourced file injection
- Customizable comment removal
  ```bash
  # ## this comment always becomes #, even if COMMENTS=false
  # %% this comment gets removed, keeping everything after # %%
  # !! this comment always gets removed 
  # thise gets removed if COMMENTS=false
  echo "hi" # inline comment stays unless NO_INLINE_COMMENTS=false

  # bash_builder_inject
  # this will become "VERSION=0.0.1"
  VERSION="$(cat VERSION)" # bash_builder_inject

  # this works to, and can be used in combination with # %%, will become "VERSION=0.0.1"
  # %% $(curl -sL https://github.com/jasenmichael/bash-builder/raw/refs/heads/main/VERSION) # bash_builder_inject



  ```
- Code block removal [example](https://github.com/jasenmichael/bash-utils/blob/main/bash-log.sh#L46-L72) [example](https://github.com/jasenmichael/bash-builder/blob/main/src/main.sh#L6-L11) 
  ```bash
  # bash_builder_remove_start/bash_builder_remove_end
  # this code block will be removed
  # bash_builder_remove_start
  START_DIR=$PWD
  SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
  cd "$SCRIPT_DIR/.." || exit
  echo -e "\033[1;33m[bash-builder]\033[0m START_DIR: $START_DIR"
  echo -e "\033[1;33m[bash-builder]\033[0m SCRIPT_DIR: $SCRIPT_DIR"
  echo -e "\033[1;33m[bash-builder]\033[0m PWD: $PWD"
  # bash_builder_remove_end

  # bash_builder_remove_after, this will remove everything after that line in the file, usefull when you want to remove a bottom section of an injected sourced file.
  ```
- Formatting with [shfmt](https://github.com/patrickvane/shfmt)
- and more..

## Installation (build from source)

```bash
git clone https://github.com/jasenmichael/bash-builder.git
cd bash-builder
./bin/build
mv ./build/bash-builder $HOME/.local/bin
```

## Usage

```bash
bash-builder src dest [options] 
```

### Options

- `-h, --help`: Show usage information and exit
- `-V, --version`: Show version information and exit
- `--debug`: Enable debug mode
- `--clean`: Clean mode, sets CLEAN=true
- `--comments`: Do not strip comments, sets COMMENTS=true
- `--no-inline-comments`: Disable inline comments, sets NO_INLINE_COMMENTS=false
- `--no-built-by-bash-builder`: Disable BUILT_BY_BASH_BUILDER_HEADER injection
- `--remove-lines-starting-with`: Remove lines starting with specified patterns

## License

MIT License - see LICENSE file for details
