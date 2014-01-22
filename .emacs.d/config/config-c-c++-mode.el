;;; c-mode, c++-mode
(defun my/c-c++-mode-setup ()
  (c-set-style "stroustrup")
  (c-set-offset 'innamespace 0)
  (c-set-offset 'arglist-close 0))

(add-hook 'c-mode-hook 'my/c-c++-mode-setup)
(add-hook 'c++-mode-hook 'my/c-c++-mode-setup)
