;; elpa
(require 'package)
(setq package-user-dir "~/.emacs.d/elisp/elpa/")
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; init-loader
(require 'init-loader)
(init-loader-load "~/.emacs.d/conf")

;(global-linum-mode t)
;(setq linum-format "%4d: ")
;(show-paren-mode t)
(setq backup-inhibited t)
(setq delete-auto-save-default t)
;(set-language-environment "Japanese")

; 後で消す
;(setq mac-pass-control-to-system nil)
