;;;; Emacs Lisp mode setting

;; eldoc
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)

;; auto-async-byte-compile
(require 'auto-async-byte-compile)
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)
