;;; c-eldoc
(require 'c-eldoc)
(defun my-c-eldoc-setup ()
  (set (make-local-variable 'eldoc-idle-delay) 0.20)
  (c-turn-on-eldoc-mode))

(add-hook 'c-mode-hook 'my-c-eldoc-setup)
(add-hook 'c++-mode-hook 'my-c-eldoc-setup)
