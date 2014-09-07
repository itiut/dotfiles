;;;; Emacs Lisp mode setting

;; eldoc
(custom-set-variables '(eldoc-minor-mode-string ""))
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
