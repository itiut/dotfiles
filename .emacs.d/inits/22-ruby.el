;;;; Ruby mode setting

(add-to-list 'auto-mode-alist '("\\.gemspec\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\Gemfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\Rakefile\\'" . ruby-mode))

(custom-set-variables
 '(ruby-deep-indent-paren nil)
 '(ruby-deep-indent-paren-style nil)
 '(ruby-insert-encoding-magic-comment nil))

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

(eval-after-load "ruby-mode"
  '(progn
     ;; ruby-end
     (require 'ruby-end)
     (custom-set-variables
      '(ruby-end-insert-newline nil))
     ))

(defun my/ruby-mode-hook ()
  (add-to-list 'ac-sources 'ac-source-rsense))

(add-hook 'ruby-mode-hook 'my/ruby-mode-hook)
