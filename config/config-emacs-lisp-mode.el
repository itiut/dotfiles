;;; emacs-lisp-mode
(defun my-emacs-lisp-mode-setup ()
  (set (make-local-variable 'eldoc-idle-delay) 0.20)
  (turn-on-eldoc-mode))

(add-hook 'emacs-lisp-mode-hook 'my-emacs-lisp-mode-setup)
