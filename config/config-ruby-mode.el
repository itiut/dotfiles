;;; ruby-mode
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))

(add-hook 'ruby-mode-hook
          '(lambda ()
             (add-to-list 'ac-sources 'ac-source-rsense)))
