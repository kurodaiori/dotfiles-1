(require 'flymake)
(add-hook 'cperl-mode-hook (
                            '(lambda ()
                               (progn
                                 (setq ident-tabs-mode nil)
                                 (setq tab-width nil)
                                 (require 'auto-completion)
                                 (require 'perl-completion)
                                 (add-to-list 'ac-sources 'ac-source-perl-completion)
                                 (perl-completion-mode t)
                                 )))
(defun perltidy-region ()
  (interactive)
  (save-excursion
    (shell-command-on-region (point) (mark) "perltidy -q" nil t)))
(defun perltidy-defun ()
  (interactive)
  (save-excursion (mark-defun)
                  (perltidy-region)))
(global-set-key "C-ct" 'perltidy-region)
(global-set-key "C-cC-t" 'perltidy-defun)

