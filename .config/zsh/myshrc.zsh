set -o vi

# lazy-function
nvm () {
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}

# variables
export NVM_NODEJS_ORG_MIRROR="https://mirrors.ustc.edu.cn/node/"
export NODE_MIRROR="https://mirrors.ustc.edu.cn/node/"
export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890

# cli-tools
export TDL_NS=yaoyaoqiekn
export TDL_PROXY=socks5://127.0.0.1:7890

# python
export PYTHONSTARTUP=$HOME/.config/python/startup.py

if [[ "$(uname -s)" == "Darwin" ]]; then
  export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.ustc.edu.cn/brew.git"
  export HOMEBREW_AUTO_UPDATE_SECS=604800

  PATH=$PATH:/usr/local/mysql/bin
  PATH=$PATH:/usr/local/apache-maven-3.9.4/bin
  PATH=$PATH:/Users/leoua7/.local/bin
  PATH=$PATH:/Users/leoua7/Apps/emsdk
  PATH=$PATH:/Users/leoua7/Apps/emsdk/upstream/emscripten

  ___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"
  if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then . "${___MY_VMOPTIONS_SHELL_FILE}"; fi
fi
