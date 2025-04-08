# bash-builder

A tool for building/transpiling bash scripts.

## Features

- Optional sourced file injection
- Customizable comment removal
- Code block removal
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
- `--clean`: Clean mode
- `--comments`: Enable comments
- `--no-inline-comments`: Disable inline comments
- `--no-built-by-bash-builder`: Disable BUILT_BY_BASH_BUILDER_HEADER injection
- `--remove-lines-starting-with`: Remove lines starting with specified patterns

## License

MIT License - see LICENSE file for details
