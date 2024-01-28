## Usage
The stow-wrapper.sh script can be used to manage the dotfiles. 

Possible options are `-S/--stow`, `-D/--delete` or `-R/--restow`. Additionaly, one or multiple arguments can be provided to install specific packages. 

By default `./stow-wrapper.sh --stow all` is called.

## Example
Restow nvim and zsh:
```bash
./stow-wrapper.sh --restow nvim zsh
```

## Dependencies
Dependencies must be resolved manually at the moment.
