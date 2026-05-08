# My Dotfiles

Cross-platform dotfiles for Linux, macOS, and Windows, managed by [chezmoi](https://www.chezmoi.io/).

## Requirements

- git
- [chezmoi](https://www.chezmoi.io/install/)

## New machine

```shell
chezmoi --source ~/.dotfiles init --branch chezmoi git@github.com:qiekn/dotfiles.git
chezmoi diff       # preview
chezmoi apply -v   # deploy
```

First run prompts for `email` and `name`; values are saved to `~/.config/chezmoi/chezmoi.toml`.

## Daily

```shell
chezmoi edit <file>   # edit source of a target
chezmoi diff          # preview pending changes
chezmoi apply -v      # deploy
chezmoi cd            # cd to ~/.dotfiles
chezmoi update        # git pull + apply
```

## Branches

- `main` — old stow setup (frozen)
- `chezmoi` — active

## Platform layout

`.chezmoiignore` filters by OS:

| Excluded on | Targets |
|---|---|
| non-macOS | `.skhdrc`, `.yabairc`, `.config/{karabiner,raycast}` |
| non-Windows | `.ideavimrc`, `.scripts/open_with_neovim.reg`, `.config/{glazewm,vsvim}` |
| Windows | `.zshrc*`, `.tmux.conf`, `.config/{zsh,tmux}`, `.oh-my-zsh` |

`.oh-my-zsh` is fetched by chezmoi as an external from [qiekn/ohmyzsh](https://github.com/qiekn/ohmyzsh), refreshed weekly (see `.chezmoiexternal.toml`).
