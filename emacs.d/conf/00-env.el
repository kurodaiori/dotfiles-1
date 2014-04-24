(set-language-environment "Japanese")

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  )

(setq mac-pass-control-to-system nil)
(setq mac-pass-command-to-system nil)
(setq mac-pass-option-to-system nil)
