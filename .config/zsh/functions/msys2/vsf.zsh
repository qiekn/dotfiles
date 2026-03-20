# fzf search files and open it at neovim
vsf() {
  fd --type f | fzf --bind "enter:become(nvim {})"
}
