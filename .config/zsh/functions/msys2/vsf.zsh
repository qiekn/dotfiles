# fzf search files and open it at neovim
vsf() {
  file=$(fzf --exit-0 --bind 'enter:accept')
  [ -n "$file" ] && nvim "$file"
}
