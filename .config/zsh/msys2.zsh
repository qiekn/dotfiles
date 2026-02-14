# This is for Windowds MSYS2 UCRT Environment
if [[ -n "$MSYSTEM" || "$(uname -s)" =~ (MSYS|MINGW|UCRT|CYGWIN) ]]; then
  export XDG_CONFIG_HOME="$HOME/.config"
  export XDG_DATA_HOME="$HOME/.local/share"
  export XDG_STATE_HOME="$HOME/.local/state"
  export XDG_CACHE_HOME="$HOME/.cache"

  # Env
  export YAZI_CONFIG_HOME="$HOME/.config/yazi"

  # PATH
  export WINHOME="/c/Users/user"

  export PATH=$PATH:"/c/Program Files/Git/cmd"
  export PATH=$PATH:"/c/Program Files/dotnet/"
  export PATH=$PATH:"/c/Apps/MiKTex/texmfs/install/miktex/bin/x64"
  export PATH=$PATH:"/c/Apps/SumatraPDF/"
  export PATH=$PATH:"/c/Apps/nodejs/"
  export PATH=$PATH:"/c/Apps/Go/bin"
  export PATH=$PATH:"/c/Users/user/AppData/Roaming/npm/"
  export PATH=$PATH:"/c/Apps/shortcuts/"
  export PATH=$PATH:"$HOME/.local/share/pnpm"
  export PATH=$PATH:"$HOME/.local/bin/"
  export PATH=$PATH:"$HOME/.local/bin/"
  export PATH=$PATH:"$WINHOME/.local/bin/"

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

  alias winhome="cd $WINHOME"
  alias desktop="cd $WINHOME/Desktop"
  alias emacs="/c/msys64/mingw64/bin/runemacs.exe"
  alias code="$WINHOME/AppData/Local/Programs/Microsoft\ VS\ Code/bin/code" # vscode

  function windata() { cd $APPDATA }

  # Fix tmux
  function tmux() {
    ps -ef | grep "[t]mux" > /dev/null || rm -f /tmp/tmux-$(id -u)/default 2>/dev/null
    command tmux "$@"
  }

  # Command --> C:\msys64\msys2_shell.cmd -defterm -here -no-start -ucrt64 -shell zsh
  # Windows Terminal current directory sync
  if [[ -n "$WT_SESSION" ]]; then
    function tell_wt_cwd() {
      printf "\e]9;9;%s\e\\" "$(cygpath -w "$PWD")"
    }

    autoload -Uz add-zsh-hook
    add-zsh-hook precmd tell_wt_cwd
  fi

fi
