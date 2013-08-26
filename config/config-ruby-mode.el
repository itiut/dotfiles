;;; ruby-mode
(add-to-list 'auto-mode-alist '("\\Gemfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec\\'" . ruby-mode))

(setq ruby-deep-indent-paren nil)
(setq ruby-deep-indent-paren-style nil)
(setq ruby-insert-encoding-magic-comment nil)

(defadvice ruby-indent-line (after unindent-closing-paren activate)
  (let ((column (current-column))
        indent offset)
    (save-excursion
      (back-to-indentation)
      (let ((state (syntax-ppss)))
        (setq offset (- column (current-column)))
        (when (and (or (eq (char-after) ?\))
                       (and (eq (char-after) ?\})
                            (eq (char-after (1+ (point))) ?\))))
                   (not (zerop (car state))))
          (goto-char (cadr state))
          (setq indent (current-indentation)))))
    (when indent
      (indent-line-to indent)
      (when (> offset 0)
        (forward-char offset)))))

(add-hook 'ruby-mode-hook
          '(lambda ()
             (add-to-list 'ac-sources 'ac-source-rsense)))
