set -o vi

# comletion-ignore-case
# autoload -Uz compinit && compinit
# zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# lazy-function
nvm () {
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

# variables
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.ustc.edu.cn/brew.git"
export HOMEBREW_AUTO_UPDATE_SECS=604800 # auto update when use brew install every week
export NVM_NODEJS_ORG_MIRROR="https://mirrors.ustc.edu.cn/node/"
export NODE_MIRROR="https://mirrors.ustc.edu.cn/node/"
export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890

# paths
PATH=$PATH:/usr/local/mysql/bin
PATH=$PATH:/Users/leoua7/.nvm/versions/node/v12.14.0/lib/node_modules/hexo-cli/bin
PATH=$PATH:/usr/local/apache-maven-3.9.4/bin
PATH=$PATH:/Users/leoua7/.local/bin # Created by `pipx` on 2023-10-12 06:02:49

# cli-tools
# alias tdl="/Users/leoua7/Desktop/dev/telegram_dl/tdl"
export TDL_NS=yaoyaoqiekn
export TDL_PROXY=socks5://127.0.0.1:7890


# -------------------------------------------
___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"; if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then . "${___MY_VMOPTIONS_SHELL_FILE}"; fi
