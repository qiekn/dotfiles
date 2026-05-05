import sys

## clear
class Cls:
    def __repr__(self):
        import os
        # Windows 用 'cls', Mac/Linux用 'clear'
        os.system('cls' if os.name == 'nt' else 'clear')
        return '' # 返回空字符串，防止打印出 0

cls = Cls()
cl = Cls()
clear = Cls()


## quit
class ExitCmd:
    def __repr__(self):
        # 直接调用系统退出
        sys.exit()


exit = ExitCmd()
quit = ExitCmd()
