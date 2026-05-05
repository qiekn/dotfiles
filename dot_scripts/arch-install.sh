#!/usr/bin/env bash
set -euo pipefail

sudo pacman -Syu --noconfirm

base_packages=(
  base
  base-devel
  sudo
  openssh
  git
  cmake
  ninja
  clang
  gdb
  make
  pkgconf
)

cli_packages=(
  zsh
  tmux
  eza
  fd
  fzf
  ripgrep
  jq
  tree
  which
  stow
  zoxide
  yazi
  xclip
  unzip
  7zip
  lazygit
  git-delta
)

editor_packages=(
  neovim
  python
  python-pynvim
  nodejs
  pnpm
  uv
)

doc_packages=(
  poppler
  resvg
)

extra_packages=(
  curl
  wget
  bear
  binutils
  elfutils
  file
)

sudo pacman -S --needed --noconfirm \
  "${base_packages[@]}" \
  "${cli_packages[@]}" \
  "${editor_packages[@]}" \
  "${doc_packages[@]}" \
  "${extra_packages[@]}"

# locale
if ! grep -Eq '^[[:space:]]*en_US\.UTF-8 UTF-8' /etc/locale.gen; then
  echo 'en_US.UTF-8 UTF-8' | sudo tee -a /etc/locale.gen > /dev/null
fi

sudo sed -i 's/^#\s*\(en_US\.UTF-8 UTF-8\)/\1/' /etc/locale.gen
sudo locale-gen
echo 'LANG=en_US.UTF-8' | sudo tee /etc/locale.conf > /dev/null

echo "done!"
