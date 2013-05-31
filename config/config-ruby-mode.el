;;; ruby-mode
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))

(setq ruby-insert-encoding-magic-comment nil)

(add-hook 'ruby-mode-hook
          '(lambda ()
             (add-to-list 'ac-sources 'ac-source-rsense)))
