(setq backup-directory-alist
      (cons (cons ".*" (expand-file-name "~/.emacs.d/backup"))
            backup-directory-alist))

(setq message-log-max 10000)
