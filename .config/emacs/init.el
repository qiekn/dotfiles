(menu-bar-mode -1)
(tool-bar-mode -1)

;; Font
(when (display-graphic-p)
  (set-face-attribute 'default nil
                      :family "MesloLGM Nerd Font Mono"
                      :height 140))

;; Theme
(add-to-list 'custom-theme-load-path
             (expand-file-name "themes" user-emacs-directory))

(load-theme 'naysayer t)


(setenv "HOME" "C:/msys64/home/user")
(setq default-directory "C:/msys64/home/user/")


;; ------------------------------------------------------------ Package system

(require 'package)

(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu"   . "https://elpa.gnu.org/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

;; ------------------------------------------------------------ Evil

(unless (package-installed-p 'evil)
  (package-install 'evil))

(require 'evil)
(evil-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
