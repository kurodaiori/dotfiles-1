(setq backup-directory-alist
      (cons (cons ".*" (expand-file-name "~/.emacs.d/backup"))
            backup-directory-alist))

(setq message-log-max 10000)

(setq backup-inhibited t)
(setq delete-auto-save-default t)
