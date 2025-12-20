# This is for Windowds MSYS2 UCRT Environment
if [[ -n "$MSYSTEM" || "$(uname -s)" =~ (MSYS|MINGW|UCRT|CYGWIN) ]]; then
  export XDG_CONFIG_HOME="$HOME/.config"
  export XDG_DATA_HOME="$HOME/.local/share"
  export XDG_STATE_HOME="$HOME/.local/state"
  export XDG_CACHE_HOME="$HOME/.cache"

  # Env
  export YAZI_CONFIG_HOME="$HOME/.config/yazi"

  # PATH

  export PATH=$PATH:"/c/Program Files/Git/cmd"
  export PATH=$PATH:"/c/Program Files/dotnet/"
  export PATH=$PATH:"/c/Apps/MiKTex/texmfs/install/miktex/bin/x64"
  export PATH=$PATH:"/c/Apps/SumatraPDF/"
  export PATH=$PATH:"/c/Apps/nodejs/"
  export PATH=$PATH:"/c/Users/user/AppData/Roaming/npm/"
  export PATH=$PATH:"/c/Apps/shortcuts/"
  export PATH=$PATH:"$HOME/.local/bin/"

  # unset APPDATA
  # unset LOCALAPPDATA
  # unset USERPROFILE


  # Windows package manager: Scoop
  export PATH="$PATH:$USERPROFILE/scoop/shims"
  export PATH="$PATH:$USERPROFILE/scoop/apps/rustup/current/.cargo/bin"
  # ln -s
  export MSYS=winsymlinks:nativestrict

  # Compiler
  export CC=clang
  export CXX=clang++

  # Alias
  alias open="explorer"
  alias make="mingw32-make"
  alias lg="lazygit"

  alias winhome="/c/Users/user"

fi
