;;;; Ruby mode setting

(custom-set-variables '(ruby-insert-encoding-magic-comment nil))

(with-eval-after-load 'ruby-mode
  ;; robe
  (add-hook 'robe-mode-hook 'ac-robe-setup)
  (add-hook 'ruby-mode-hook 'robe-mode))
