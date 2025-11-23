# This is for Windowds MSYS2 UCRT Environment
if [[ -n "$MSYSTEM" || "$(uname -s)" =~ (MSYS|MINGW|UCRT|CYGWIN) ]]; then
  export XDG_CONFIG_HOME="$HOME/.config"
  export XDG_DATA_HOME="$HOME/.local/share"
  export XDG_STATE_HOME="$HOME/.local/state"
  export XDG_CACHE_HOME="$HOME/.cache"

  # PATH
  export PATH=$PATH:"/c/Program Files/Git/cmd"
  export PATH=$PATH:"$HOME/.local/bin/"

  unset APPDATA
  unset LOCALAPPDATA
  unset USERPROFILE

  # ln -s
  export MSYS=winsymlinks:nativestrict

  # Compiler
  export CC=clang
  export CXX=clang++

  # Alias
  alias open="explorer"
  alias make="mingw32-make"
  alias lg="lazygit"

fi
