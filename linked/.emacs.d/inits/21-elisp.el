;;;; Emacs Lisp mode setting

(add-to-list 'auto-mode-alist '("\\Cask\\'" . emacs-lisp-mode))

;; eldoc
(custom-set-variables '(eldoc-minor-mode-string ""))
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
