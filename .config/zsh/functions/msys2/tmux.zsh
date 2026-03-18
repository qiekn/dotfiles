# Fix tmux socket on MSYS2
function tmux() {
  ps -ef | grep "[t]mux" > /dev/null || rm -f /tmp/tmux-$(id -u)/default 2>/dev/null
  command tmux "$@"
}
