# modules/msys2/alias.zsh — MSYS2 specific aliases

alias open="explorer"
alias make="mingw32-make"
alias pdf="start sumatrapdf"
alias findpdf="fd -e pdf | fzf | xargs -r sumatrapdf"
alias fpdf='findpdf'

alias winhome="cd $WINHOME"
alias desktop="cd $WINHOME/Desktop"
alias emacs="/c/msys64/mingw64/bin/runemacs.exe"
alias code="$WINHOME/AppData/Local/Programs/Microsoft\ VS\ Code/bin/code"

alias gdb='gdb -q'
alias gdb-multiarch='gdb-multiarch -q'
alias debug='gdb-multiarch -q'
alias msys2conf='nvim ~/.dotfiles/.config/zsh/modules/msys2/'
alias msys2reload='source ~/.dotfiles/.config/zsh/loader.zsh'
