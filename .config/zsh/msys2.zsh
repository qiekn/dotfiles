# This is for Windowds MSYS2 UCRT Environment
if [[ -n "$MSYSTEM" || "$(uname -s)" =~ (MSYS|MINGW|UCRT|CYGWIN) ]]; then
  export XDG_CONFIG_HOME="$HOME/.config"
  export XDG_DATA_HOME="$HOME/.local/share"
  export XDG_STATE_HOME="$HOME/.local/state"
  export XDG_CACHE_HOME="$HOME/.cache"

  unset APPDATA
  unset LOCALAPPDATA
  unset USERPROFILE

  # ln -s
  export MSYS=winsymlinks:nativestrict

  # Compiler
  export CC=clang
  export CXX=clang++

  alias open="explorer"
  alias make="mingw32-make"
  alias lg="/C/ProgramData/chocolatey/bin/lazygit.exe"

  # PATH
  export PATH=$PATH:"/c/Program Files/Git/cmd"
  export PATH=$PATH:"~/.local/bin/"
fi
