(require 'helm-config)
(require 'helm-descbinds)

(helm-descbinds-mode)

(global-set-key (kbd "\C-c\C-h") 'helm-mini)
;(global-set-key (kbd "M-y") 'helm-show-kill-ring)
;(global-set-key (kbd "M-i") 'helm-imenu)
