;;; markdown-mode
(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

;; whitespaceのauto-cleanupをオフに
(add-hook 'markdown-mode-hook
          '(lambda ()
             (set (make-local-variable 'whitespace-action) nil)))
