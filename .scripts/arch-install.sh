#!/usr/bin/env bash
set -e

sudo pacman -Syu --noconfirm

sudo pacman -S --noconfirm \
    base \
    base-devel \
    clang \
    cmake \
    gdb \
    eza \
    fzf \
    git \
    lazygit \
    make \
    neovim \
    ninja \
    nodejs \
    openssh \
    pnpm \
    python \
    python-pynvim \
    ripgrep \
    stow \
    sudo \
    tmux \
    tree \
    unzip \
    uv \
    which \
    yazi \
    zoxide \
    zsh


echo 'LANG=en_US.UTF-8' | sudo tee /etc/locale.conf

echo "done!"
