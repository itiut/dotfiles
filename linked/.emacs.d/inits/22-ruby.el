;;;; Ruby mode setting

(custom-set-variables
 ;; ruby-mode
 '(ruby-deep-indent-paren nil)
 '(ruby-deep-indent-paren-style nil)
 '(ruby-insert-encoding-magic-comment nil)

 ;; ruby-end
 '(ruby-end-insert-newline nil))

(eval-after-load 'ruby-mode
  '(progn
     (require 'ruby-end)

     ;; robe
     (add-hook 'robe-mode-hook 'ac-robe-setup)
     (add-hook 'ruby-mode-hook 'robe-mode)))
